var myApp = angular.module('myApp', ['angularMoment','ngRoute','angularUtils.directives.dirPagination']);

myApp.config(function($routeProvider) {
    $routeProvider
    .when("/home", {
        templateUrl : "pages/login.html",
		controller: 'MainCtrl'
    })
    .when("/dashboard", {
        templateUrl : "pages/dashboard.html",
		controller: 'DashCtrl'
    })
    .when("/myusers", {
        templateUrl : "pages/myUsers.html",
		controller: 'UserCtrl'
    })
    .when("/myorder", {
        templateUrl : "pages/myOrder.html",
		controller: 'OrderCtrl'
    })
    .when("/mycustomer", {
        templateUrl : "pages/myCustomer.html",
		controller: 'CustCtrl'
    })
    .when("/logout", {
        /* templateUrl: 'pages/logout.html',
		controller: 'LogoutCtrl' */
		resolve: {
			logout: ['logoutService', function (logoutService) {
				logoutService();
            }]
		},
    })
    .otherwise({
		redirectTo: '/home'
	});
});

myApp.directive('datepicker', function() {   
   return {
    restrict: 'A',
    require: 'ngModel',
     link: function (scope, element, attrs, ngModelCtrl) {
        element.datepicker({
            dateFormat: 'yy-mm-dd',
			minDate: new Date(),
            onSelect: function (dateText) {
                // scope.date = date;
				ngModelCtrl.$setViewValue(dateText);
                scope.$apply();
            }
        });
    }
  };
});

myApp.controller('MainCtrl', function ($scope, $http, $location) {
		// console.log( "MainCtrl" );		
		$scope.submitForm = function(){
			console.log("posting data....");
			$scope.dataLoading = true;			
			// console.log( JSON.stringify($scope.login) );
			sessionStorage.loggedIn = false;
			formData = $scope.login;
			
			$http.post('web/login/', JSON.stringify(formData)).then(function(response) {
				if(response.status === 200){
					console.log(response.data);
					if (response.data[0]) {
						sessionStorage.loggedIn = true;
						sessionStorage.user = response.data[0].name;
						sessionStorage.level = response.data[0].level;
						sessionStorage.userid = response.data[0].id;
						sessionStorage.authdata = btoa(response.data[0].email+':'+response.data[0].password);
						
						/* $window.localStorage.setItem('loggedIn', true);
						$window.localStorage.setItem('user', response.data[0].name); */
						
						$http.defaults.headers.common['Authorization'] = 'Basic ' + sessionStorage.authdata; // jshint ignore:line
						$location.path('/dashboard');
						// $state.transitionTo('dashboard');
					}else{
						$scope.alertMsg = "Invalid Email or Password";
						console.log( $scope.alertMsg );
					}
				}
			})
			.catch(function activateError(error) {
				console.log('An error happened:' + error);
			});
		}
		
});

myApp.controller('CustCtrl', function ($scope, $http, $location) {
	
	$scope.listCustomers = [];
	$http.get("web/listCustomers/").then(function(response) {
		$scope.listCustomers = response.data;
	});
	
});

myApp.controller('OrderCtrl', function ($scope, $http, $location) {
	
	$scope.formatDate = function(date){
		var dateOut = new Date(date);
		return dateOut;
	};
	
	$scope.dtime = function(ndate){
		var a = new Date();
		var dateString = moment(ndate).format('MM/DD/YYYY');
		var b = new Date(dateString);
		
		var utc1 = Date.UTC(a.getFullYear(), a.getMonth(), a.getDate());
		var utc2 = Date.UTC(b.getFullYear(), b.getMonth(), b.getDate());
		return Math.floor((utc2 - utc1) / (1000 * 3600 * 24));
	}
	
	$scope.userName = '';
	if(sessionStorage.user){
		console.info( "user: " + sessionStorage.user );
		$scope.userName = sessionStorage.user;
	}
		
	$scope.listOrders = [];
	$http.post("web/listOrder/", {
		user_id: sessionStorage.userid
	}).then(function(response) {
		
		$scope.listOrders = response.data;
	},function (error) { 
		$.growl.error({ message: "Gagal Akses API >"+error });
	});
	
});

myApp.controller('UserCtrl', function ($scope, $http, $location) {
	
	$scope.listUsers = [];	
	$scope.newUser = function(newUsers){			
		$http.post("web/addUser/",JSON.stringify(newUsers)).then(function(reply) {			
			if(reply.status === 200){
				console.info("reply: "+JSON.stringify(reply));				
				if(!reply.data.error){
					$.growl.notice({ message: reply.data.msg });
					$scope.loadUsers();
				} else{
					$.growl.error({ message: reply.data.msg });
				}
			}
		})
		.catch(function activateError(error) {
			$.growl.error({ message: "Gagal Akses API >"+error });
		});
	}
	
	$scope.loadUsers = function(){
		$http.get("web/listUsers/").then(function(response) {
			$scope.listUsers = response.data;
		});
	}
	
	$scope.loadUsers();
});

myApp.controller('DashCtrl', function ($scope, $http, $location) {
		
		$scope.myOrder = [{
			item: '', jml: '', ddline: '', ket: ''
		}];
		
		$scope.logout = function(){
			$location.path('/logout');
		}
		
		$scope.statusOrder = [
			{value: 0, name: 'Design' },
			{value: 1, name: 'Indoor' },
			{value: 2, name: 'Outdoor' },
			{value: 3, name: 'A3' },
			{value: 4, name: 'Offset' },
			{value: 5, name: 'Lainnya' },
			{value: 6, name: 'Ready' },
			{value: 7, name: 'Sudah Diambil' }
		];
		
		console.info( $scope.statusOrder );
		
		$scope.reset = function () {
			console.info("reset myOrder ...");				
			$scope.addItem.item = '';
			$scope.addItem.jml = '';
			$scope.addItem.ddline = '';
			$scope.addItem.ket = '';
		}
		
		$scope.dtime = function(ndate){
			var a = new Date();
			var dateString = moment(ndate).format('MM/DD/YYYY');
			var b = new Date(dateString);
			
			var utc1 = Date.UTC(a.getFullYear(), a.getMonth(), a.getDate());
			var utc2 = Date.UTC(b.getFullYear(), b.getMonth(), b.getDate());

			return Math.floor((utc2 - utc1) / (1000 * 3600 * 24));
		}
		
		$scope.newOrder = function(addItem){
			console.info("reply: "+JSON.stringify(addItem));
			
			$http.post("web/addOrder/",JSON.stringify(addItem)).then(function(reply) {
				console.info("reply: "+JSON.stringify(response));
				if(reply.status === 200){
					console.info("reply: "+ angular.toJson(reply));
					if(!reply.data.error){
						$.growl.notice({ message: reply.data.msg });
						
						$scope.loadOrder();
					} else{
						$.growl.error({ message: reply.data.msg });
					}
				}
			},function (error) {
				$.growl.error({ message: "Gagal Akses API >"+error });
			});
		}
		
		$scope.listOrder = [];
		$scope.loadOrder = function(){
			$http.post("web/listOrder/", {user_id: sessionStorage.userid}).then(function(response) {
				$scope.listOrder = response.data;				
			},function (error) { 
				$.growl.error({ message: "Gagal Akses API >"+error });
			});
		}
		
		$scope.loadOrder();
});
	
/* myApp.controller('showModalTabelKemungkinan', function ($uibModalInstance) {
	var $ctrl = this;
	// $scope.newTblKemungkinan = item;	
	$ctrl.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
}); */

var ModalInstanceCtrl = function ($scope, $modalInstance, items, selected) {

	$scope.items = items;
	$scope.selected = {
		item: selected || items[0]
	};

	$scope.ok = function () {
		$modalInstance.close($scope.selected.item);
	};

	$scope.cancel = function () {
		$modalInstance.dismiss('cancel');
	};
};
	  
myApp.run(['$rootScope', '$location', '$http', function ($rootScope, $location, $http) {
	// keep user logged in after page refresh
	console.info( "loggedIn: " + JSON.stringify(sessionStorage) );
	if (sessionStorage.loggedIn) {
		$http.defaults.headers.common['Authorization'] = 'Basic ' + sessionStorage.authdata; // jshint ignore:line
		
		// Set Global Variabel
		$rootScope.userId = sessionStorage.userid;
		$rootScope.userName = sessionStorage.user;
		$rootScope.userLevel = sessionStorage.level;
	}
 
	$rootScope.$on('$locationChangeStart', function (event, next, current) {
		// redirect to login page if not logged in
		if ($location.path() !== '/home' && sessionStorage.loggedIn !='true') {
			console.log(" redirect to /home");
			$location.path('/home');
		}
	});
}]);
	
myApp.factory('logoutService', function ($location) {
    return function () {
		console.log(" redirect to /home");
		sessionStorage.clear();	
		console.info( "loggedOut: " + JSON.stringify(sessionStorage) );
		// $location.path('/home');
		redirectTo: '/home'
    }
});