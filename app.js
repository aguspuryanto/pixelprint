var myApp = angular.module('myApp', ['angularMoment','ngRoute','angularUtils.directives.dirPagination','xeditable']);

myApp.config(function($routeProvider, $httpProvider) {
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
    .when("/myusers/:id", {
        templateUrl : "pages/myEditUsers.html",
		controller: 'EditUserCtrl'
    })
    .when("/myorder", {
        templateUrl : "pages/myOrder.html",
		controller: 'OrderCtrl'
    })
    .when("/myorder/:param", {
        templateUrl : "pages/myOrder.html",
		controller: 'OrderCtrl'
    })
    .when("/mycustomer", {
        templateUrl : "pages/myCustomer.html",
		controller: 'CustCtrl'
    })
    .when("/setting", {
		title: 'Setting',
        templateUrl : "pages/setting.html",
		controller: 'SettingCtrl'
    })
    .when("/mykasir", {
        templateUrl : "pages/myKasir.html",
		controller: 'KasirCtrl'
    })
    .when("/myhistory", {
        templateUrl : "pages/myHistory.html",
		controller: 'HistoryCtrl'
    })
    .when("/myhistory/:param", {
        templateUrl : "pages/myHistory.html",
		controller: 'HistoryCtrl'
    })
    .when("/logout", {
        templateUrl: 'pages/logout.html',
		controller: 'LogoutCtrl'
		/* resolve: {
			logout: ['logoutService', function (logoutService) {
				logoutService();
            }]
		}, */
    })
    .otherwise({
		redirectTo: '/home'
	});
	
	$httpProvider.defaults.headers.common['Cache-Control'] = 'no-cache';
    $httpProvider.defaults.cache = false;
});

myApp.directive('datepicker', function() {   
   return {
    restrict: 'A',
    require: 'ngModel',
     link: function (scope, elm, attrs, ngModelCtrl) {
        elm.datepicker({
            dateFormat: 'yy-mm-dd',
			minDate: new Date(),
            onSelect: function (dateText) {
				ngModelCtrl.$setViewValue(dateText);
                scope.$apply();
            }
        });
    }
  };
});

myApp.directive('timepicker', function() {   
   return {
    restrict: 'A',
    require: 'ngModel',
    link: function (scope, elm, attrs, ngModelCtrl) {
        elm.timepicker({
			dateFormat: 'yy-mm-dd',
            timeFormat:  'H:i',
			scrollDefault: 'now',
            onSelect: function () {
				console.info( 'setTime: ' + scope.addItem.ddline + ' = ' + elm.val() );
				ngModelCtrl.$setViewValue(elm.val());
                scope.$apply();
            }
        });
		
		elm.bind('blur', function() {
			// console.info( 'setTime: ' + elm.val() );
			// ngModelCtrl.$setViewValue(elm.val());
            // scope.$apply();
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
					// console.log(response.data);
					if (response.data[0]) {
						sessionStorage.clear();	
						// sessionStorage.empty();	
						// delete sessionStorage
						sessionStorage.setItem('loggedIn', true);
						sessionStorage.setItem('user', response.data[0].name);
						sessionStorage.setItem('level', response.data[0].level);
						sessionStorage.setItem('userid', response.data[0].id);
						sessionStorage.setItem('authdata', btoa(response.data[0].email+':'+response.data[0].password));
						
						console.info( sessionStorage );
						$location.path('/dashboard');
					}else{
						$scope.alertMsg = "Invalid Email or Password";
						console.log( $scope.alertMsg );
					}
				}
			},function (error) {
				$.growl.error({ message: "Gagal Akses API >"+error });
			});
		}
		
		$scope.$on('$viewContentLoaded', function(event){ 
		  console.log( 'code that will be executed ... ' );
		  // every time this view is loaded

		 });
		
});

myApp.controller('SettingCtrl', function ($scope, $http, $location) {
	console.log(" SettingCtrl ...");
	
	$scope.statusOrder = [];
	$scope.getstatusOrder = function(){
		$http.get("web/listStatusOrder/").then(function(reply) {
			console.info("listStatusOrder: "+JSON.stringify(reply));
			$scope.statusOrder = reply.data;
		});
	}
	
	$scope.saveStatusOrder = function(){
		console.info( "New statusOrder: " + $scope.addstatusOrder );
		
		var dataSend = {
			user_id: sessionStorage.getItem('userid'),
			user_level: sessionStorage.getItem('level'),
			// orderid: so.orderid,
			orderstatus: $scope.addstatusOrder
		};
		
		$http.post("web/addStatusOrder/", dataSend).then(function(reply) {
			console.info(reply);
			if(reply.status === 200){
				$.growl.notice({ message: reply.data.msg });
				$scope.getstatusOrder();
			}else{
				$.growl.error({ message: reply.data.msg });
			}
			
		},function (error) { 
			$.growl.error({ message: "Gagal Akses API >"+error });
		});
	}
	
	$scope.userRole = [];
	$scope.getuserRole = function(){
		$http.get("web/userRole/").then(function(reply) {
			console.info("userRole: "+JSON.stringify(reply));
			$scope.userRole = reply.data;
		});
	}
	
	$scope.saveLevelUser = function(){
		console.info( "New LevelUser: " + $scope.addlevelUser );
		
		var dataSend = {
			user_id: sessionStorage.getItem('userid'),
			user_level: sessionStorage.getItem('level'),
			levelid: $scope.addlevelId,
			leveluser: $scope.addlevelUser
		};
		
		$http.post("web/adduserRole/", dataSend).then(function(reply) {
			console.info(reply);
			if(reply.status === 200){
				$.growl.notice({ message: reply.data.msg });
				$scope.getuserRole();
			}else{
				$.growl.error({ message: reply.data.msg });
			}
			
		},function (error) { 
			$.growl.error({ message: "Gagal Akses API >"+error });
		});
	}
});

myApp.controller('LogoutCtrl', function ($scope, $http, $location) {
	console.log(" redirect to /home");
	sessionStorage.clear();	
	
	console.info( "loggedOut: " + JSON.stringify(sessionStorage) );
	$location.path('/home');
	// redirectTo: '/home'
});

myApp.controller('HistoryCtrl', function ($scope, $http, $location, $routeParams) {
	
	$scope.params = $routeParams.param;
	console.log( "routeParams: " + $scope.params );
	
	$scope.listHistorys = [];
	$http.post("web/listHistory/", {
		user_id: sessionStorage.getItem('userid'),
		orderid: $scope.params
	}).then(function(response) {
		$scope.listHistorys = response.data;
	});
	
});

myApp.controller('CustCtrl', function ($scope, $http, $location) {
	
	$scope.listCustomers = [];
	$http.get("web/listCustomers/").then(function(response) {
		$scope.listCustomers = response.data;
	});
	
});

myApp.controller('OrderCtrl', function ($scope, $http, $location, $routeParams) {
	
	String.prototype.ucfirst = function(){
		return this.charAt(0).toUpperCase() + this.substr(1);
	}
	
	$scope.statusName = $routeParams.param;
	$scope.statusName = $scope.statusName.ucfirst();
	console.log( "routeParams: " + $scope.statusName );
	// console.log( "routeParams: " + $scope.getStatusOrder($scope.statusName) );
	
	$scope.statusOrder = [];
	$http.get("web/listStatusOrder/").then(function(reply) {
		console.info("listStatusOrder: "+JSON.stringify(reply));
		$scope.statusOrder = reply.data;
	});
	
	$scope.getStatusOrder = function(val){
		console.info( "orderstatus:" + val );
		var statusOrderSelected = 0;
		angular.forEach($scope.statusOrder, function(Obj, index){
			if(val==Obj.status){
				// console.info( Obj );
				statusOrderSelected = Obj.id;
			}
		});
		return statusOrderSelected;
	}
	
	$scope.formatDate = function(date){
		// console.info( date );
		var dateOut = new Date(date);
		return dateOut;
	};
	
	$scope.dtime = function dtime(ndate){
		var a = new Date();
		var dateString = moment(ndate).format('MM/DD/YYYY');
		var b = new Date(dateString);
		
		var utc1 = Date.UTC(a.getFullYear(), a.getMonth(), a.getDate());
		var utc2 = Date.UTC(b.getFullYear(), b.getMonth(), b.getDate());
		return Math.floor((utc2 - utc1) / (1000 * 3600 * 24));
	}
		
	$scope.userName = '';
	if(sessionStorage.getItem('user')){
		console.info( "user: " + sessionStorage.getItem('user') );
		$scope.userName = sessionStorage.getItem('user');
	}
	
	$scope.listOrders = [];
	$http.post("web/listOrder/", {
		user_id: sessionStorage.getItem('userid'),
		status: $scope.getStatusOrder($scope.statusName)
	}).then(function(response) {
		
		$scope.listOrders = response.data;
	},function (error) { 
		$.growl.error({ message: "Gagal Akses API >"+error });
	});
	
	$scope.saveOrderStatus = function(so, newso){
		// console.info('Sales Order : ', so);
		console.info( "New Status : " + JSON.stringify(newso) );
		
		var dataSend = {
			user_id: sessionStorage.getItem('userid'),
			user_level: sessionStorage.getItem('level'),
			orderid: so.orderid,
			orderstatus: newso.name
		};
		
		$http.post("web/updtOrderStatus/", dataSend).then(function(reply) {
			console.info(reply);
			if(reply.status === 200){
				$.growl.notice({ message: reply.data.msg });
				$scope.loadOrder();
			}else{
				$.growl.error({ message: reply.data.msg });
			}
			
		},function (error) { 
			$.growl.error({ message: "Gagal Akses API >"+error });
		});
	}
	
	// sort
	$scope.sort = function(keyname){
		console.info( "sort " + keyname );
        $scope.sortKey = keyname;   //set the sortKey to the param passed
        $scope.reverse = !$scope.reverse; //if true make it false and vice versa
    }
	
});

myApp.controller('EditUserCtrl', function ($scope, $http, $location, $routeParams) {
	
	$scope.id = $routeParams.id;
	console.log( "UserID: " + $scope.id );
	
	$scope.user = [];
	
	$scope.userRole = [];
	/* $http.get("web/userRole/").then(function(reply) {
		console.info("userRole: "+JSON.stringify(reply));
		$scope.userRole = reply.data;
	}); */
	
	$scope.listUsers = [];
	/* $http.get("web/listUsers/").then(function(response) {
		$scope.listUsers = response.data;
	}); */
	
	$scope.user = {
		// display_name: usr.name, email: usr.email, password: usr.password, level: usr.level
	}
});

myApp.controller('UserCtrl', function ($scope, $http, $location, $routeParams) {
	
	/* $scope.params = $routeParams.param;
	console.log( "routeParams: " + $scope.params ); */
	
	// $scope.user = [];	
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
	
	/* $scope.editUser = function(usr){
		console.info('Edit User : ' + JSON.stringify(usr));
		$scope.user = {
			display_name: usr.name, email: usr.email, password: usr.password, level: usr.level
		}
	} */
	
	$scope.deleteUser = function(userid){
		console.info('Delete User : ' + userid);
		
		$http.post("web/deleteUsr/", {
			user_id: sessionStorage.getItem('userid'),
			user_level: sessionStorage.getItem('level'),
			delete_id: userid
		}).then(function(reply) {		
			// $scope.listOrders = response.data;
			if(reply.status === 200){
				console.info("reply: "+JSON.stringify(reply));
				if(!reply.data.error){
					$.growl.notice({ message: reply.data.msg });
					$scope.loadUsers();
				} else{
					$.growl.error({ message: reply.data.msg });
				}
			}
		},function (error) { 
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

myApp.controller('KasirCtrl', function ($scope, $http, $location) {
	
	/* $scope.params = $routeParams.param;
	console.log( "routeParams: " + $scope.params ); */
	
	$scope.formatDate = function(date){
		// console.info( date );
		var dateOut = new Date(date);
		return dateOut;
	};
	
	$scope.userName = '';
	if(sessionStorage.getItem('user')){
		console.info( "user: " + sessionStorage.getItem('user') );
		$scope.userName = sessionStorage.getItem('user');
	}
		
	$scope.listOrders = [];	
	$scope.loadOrder = function(){
		$http.post("web/listOrder/", {
			user_id: sessionStorage.getItem('userid'),
			user_level: sessionStorage.getItem('level'),
			// params: $scope.params
		}).then(function(response) {		
			$scope.listOrders = response.data;
		},function (error) { 
			$.growl.error({ message: "Gagal Akses API >"+error });
		});
	};
	
	$scope.statusOrder = [];
	$http.get("web/listStatusOrder/").then(function(reply) {
		console.info("listStatusOrder: "+JSON.stringify(reply));
		$scope.statusOrder = reply.data;
	});
	
	$scope.getStatusOrder = function(val){
		// console.info( val );
		var statusOrderSelected = 0;
		angular.forEach($scope.statusOrder, function(Obj, index){
			if(val==Obj.name){
				// console.info( Obj );
				statusOrderSelected = Obj.value;
			}
		});
		return statusOrderSelected;
	}
	// $scope.newOrderSelected = $scope.statusOrder[0];
	
	$scope.renameNomerSO = function(so){
		console.info('Sales Order : ', so);
		
		var dataSend = {
			user_id: sessionStorage.getItem('userid'),
			user_level: sessionStorage.getItem('level'),
			orderid: so.orderid,
			nomorso: so.nomorso
		};
		
		$http.post("web/updtOrder/", dataSend).then(function(reply) {
			console.info(reply);
			if(reply.status === 200){
				$.growl.notice({ message: reply.data.msg });
				$scope.loadOrder();
			}else{
				$.growl.error({ message: reply.data.msg });
			}
			
		},function (error) { 
			$.growl.error({ message: "Gagal Akses API >"+error });
		});
	}
	
	$scope.saveOrderStatus = function(so, newso){
		// console.info('Sales Order : ', so);
		console.info( "New Status : " + JSON.stringify(newso) );
		
		var dataSend = {
			user_id: sessionStorage.getItem('userid'),
			user_level: sessionStorage.getItem('level'),
			orderid: so.orderid,
			orderstatus: newso.name
		};
		
		$http.post("web/updtOrderStatus/", dataSend).then(function(reply) {
			console.info(reply);
			if(reply.status === 200){
				$.growl.notice({ message: reply.data.msg });
				$scope.loadOrder();
			}else{
				$.growl.error({ message: reply.data.msg });
			}
			
		},function (error) { 
			$.growl.error({ message: "Gagal Akses API >"+error });
		});
	}
});

myApp.controller('DashCtrl', function ($scope, $http, $location) {
		
		if(sessionStorage.getItem('level') == '3'){
			console.log(" redirect to /kasir");
			// console.log( sessionStorage );
			$location.path('/mykasir');
		}
		
		$scope.addItem = {};
		// $scope.addItem.orderopr = sessionStorage.getItem('userid');
		
		$scope.myOrder = [{
			item: '', jml: '', ddline: '', ket: ''
		}];
		
		$scope.logout = function(){
			$location.path('/logout');
		}
		
		$scope.statusOrder = function(){
			// listStatusOrder
			$http.get("web/listStatusOrder/").then(function(reply) {
				console.info("listStatusOrder: "+JSON.stringify(reply));
				return reply.data;
			});
		};
		// console.info( $scope.statusOrder );
		
		$scope.reset = function () {
			console.info("reset myOrder ...");				
			$scope.addItem.item = '';
			$scope.addItem.jml = '';
			$scope.addItem.ddline = '';
			$scope.addItem.ket = '';
		}
		
		$scope.formatDate = function(date){
			var dateOut = new Date(date);
			return dateOut;
		};
	
		$scope.dtime = function dtime(ndate){
			var a = new Date();
			var dateString = moment(ndate).format('MM/DD/YYYY');
			var b = new Date(dateString);
			
			var utc1 = Date.UTC(a.getFullYear(), a.getMonth(), a.getDate());
			var utc2 = Date.UTC(b.getFullYear(), b.getMonth(), b.getDate());

			return Math.floor((utc2 - utc1) / (1000 * 3600 * 24));
		}
		
		// $scope.addItem.ddtime = "07:11";		
		$scope.newOrder = function(addItem){
			console.info("posting: "+JSON.stringify(addItem));
			
			$http.post("web/addOrder/",JSON.stringify(addItem)).then(function(reply) {
				console.info("reply: "+JSON.stringify(reply));
				
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
			$http.post("web/listOrder/", {
				user_id: sessionStorage.getItem('userid'),
				user_level: sessionStorage.getItem('level'),
				// params: $scope.params
			}).then(function(response) {
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
	  
myApp.run(['$rootScope', '$location', '$http', 'editableOptions', function ($rootScope, $location, $http, editableOptions) {
	// keep user logged in after page refresh
	if (sessionStorage.loggedIn) {
		$http.defaults.headers.common['Authorization'] = 'Basic ' + sessionStorage.authdata; // jshint ignore:line
		// Set Global Variabel
		$rootScope.userId = sessionStorage.getItem('userid');
		$rootScope.userName = sessionStorage.getItem('user');
		$rootScope.userLevel = sessionStorage.getItem('level');

		console.info( "userId:" + $rootScope.userId + ";userName:" + $rootScope.userName + ";userLevel:" + $rootScope.userLevel );
		console.info( "loggedIn: " + JSON.stringify(sessionStorage) );
	}
	
	editableOptions.theme = 'bs3'; // bootstrap3 theme. Can be also 'bs2', 'default'
	
	$rootScope.$on('$locationChangeStart', function (event, next, current) {
		// redirect to login page if not logged in
		// if ($location.path() !== '/home' && sessionStorage.loggedIn !='true') {
		if (sessionStorage.loggedIn !='true') {
			console.log(" redirect to /home");
			$location.path('/home');
		}
	});
	
	$rootScope.$on('$routeChangeSuccess', function (event, current, previous) {
        $rootScope.title = current.$$route.title;
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

myApp.filter('slugify', function () {
    return function (input) {
        if (!input) return; 
        // make lower case and trim
        var slug = input.toLowerCase().trim();
         // replace invalid chars with spaces
        slug = slug.replace(/[^a-z0-9\s-]/g, '');
         // replace multiple spaces or hyphens with a single hyphen
        slug = slug.replace(/[\s-]+/g, '-');
         return slug;
    };
});