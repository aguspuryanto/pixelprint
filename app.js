var myApp = angular.module('myApp', ['angularMoment','ngRoute','angularUtils.directives.dirPagination','xeditable']);

myApp.config(function($routeProvider, $httpProvider) {
    $routeProvider
    .when("/home", {
		title: 'PIXEL PRINT',
        // templateUrl : "pages/login.html",
        templateUrl : "gh-pages/pages/login.html",
		controller: 'MainCtrl'
    })
    .when("/dashboard", {
        // templateUrl : "pages/dashboard.html",
        templateUrl : "gh-pages/pages/index.html",
		controller: 'DashCtrl'
    })
    .when("/myusers", {
		title: 'PIXEL PRINT',
        templateUrl : "gh-pages/pages/myUsers.html",
		controller: 'UserCtrl'
    })
    .when("/myusers/:id", {
		title: 'PIXEL PRINT',
        templateUrl : "gh-pages/pages/myEditUsers.html",
		controller: 'EditUserCtrl'
    })
    .when("/myorder", {
		title: 'PIXEL PRINT',
        templateUrl : "gh-pages/pages/myOrder.html",
		controller: 'OrderCtrl'
    })
    .when("/myorder/:param", {
		title: 'PIXEL PRINT',
        templateUrl : "gh-pages/pages/myOrder.html",
		controller: 'OrderCtrl'
    })
    .when("/mycustomer", {
        templateUrl : "gh-pages/pages/myCustomer.html",
		controller: 'CustCtrl'
    })
    .when("/setting", {
		title: 'Setting',
        templateUrl : "gh-pages/pages/setting.html",
		controller: 'SettingCtrl'
    })
    .when("/mykasir", {
		title: 'PIXEL PRINT',
        templateUrl : "gh-pages/pages/myKasir.html",
		controller: 'KasirCtrl'
    })
    .when("/myhistory", {
		title: 'PIXEL PRINT',
        templateUrl : "gh-pages/pages/myHistory.html",
		controller: 'HistoryCtrl'
    })
    .when("/myhistory/:param", {
		title: 'PIXEL PRINT',
        templateUrl : "gh-pages/pages/myHistory.html",
		controller: 'HistoryCtrl'
    })
    .when("/liburnas", {
		title: 'PIXEL PRINT',
        templateUrl : "gh-pages/pages/hLiburNas.html",
		controller: 'LiburCtrl'
    })
    .when("/smsinbox", {
		// title: 'SMS INBOX',
        templateUrl : "gh-pages/pages/smsInbox.html",
		controller: 'InboxCtrl'
    })
    .when("/smsoutbox", {
		// title: 'PIXEL PRINT',
        templateUrl : "gh-pages/pages/smsOutbox.html",
		controller: 'OutboxCtrl'
    })
    .when("/smsphonebook", {
		// title: 'PIXEL PRINT',
        templateUrl : "gh-pages/pages/smsPhoneBook.html",
		controller: 'PhoneBookCtrl'
    })
    .when("/smssend", {
		// title: 'PIXEL PRINT',
        templateUrl : "gh-pages/pages/smsSender.html",
		controller: 'PhoneBookCtrl'
    })
    .when("/logout", {
		title: 'PIXEL PRINT',
        templateUrl: 'gh-pages/pages/logout.html',
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

myApp.controller('MainCtrl', function ($scope, $http, $location, $timeout) {
	// console.log( "MainCtrl" );
	if(sessionStorage.getItem('user')){
		$timeout(function(){
			$scope.$apply(function(){ $location.path('/dashboard'); });
		},1);
	}

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
						
						// console.info( sessionStorage );
						$timeout(function(){
							$scope.$apply(function(){ $location.path('/dashboard'); });
						},1);

						/*$scope.$apply(function(){
						   $location.path('/dashboard');
						});*/
					}else{
						$scope.alertMsg = "Invalid Email or Password";
						console.log( $scope.alertMsg );
					}
				}
			},function (error) {
				$.growl.error({ message: "Gagal Akses API >"+ JSON.stringify(error) });
			});
		}
		
		$scope.$on('$viewContentLoaded', function(event){
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
		// console.info( "New statusOrder: " + $scope.addstatusOrder );
		
		var dataSend = {
			user_id: sessionStorage.getItem('userid'),
			user_level: sessionStorage.getItem('level'),
			// orderid: so.orderid,
			orderstatus: $scope.addstatusOrder
		};
		
		$http.post("web/addStatusOrder/", dataSend).then(function(reply) {
			// console.info(reply);
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
			// console.info("userRole: "+JSON.stringify(reply));
			$scope.userRole = reply.data;
		});
	}
	
	$scope.saveLevelUser = function(){
		// console.info( "New LevelUser: " + $scope.addlevelUser );
		
		var dataSend = {
			user_id: sessionStorage.getItem('userid'),
			user_level: sessionStorage.getItem('level'),
			levelid: $scope.addlevelId,
			leveluser: $scope.addlevelUser
		};
		
		$http.post("web/adduserRole/", dataSend).then(function(reply) {
			// console.info(reply);
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
	// console.log( "routeParams: " + $scope.params );
	
	$scope.listHistorys = [];
	$http.post("web/listHistory/", {
		user_id: sessionStorage.getItem('userid'),
		orderid: $scope.params
	}).then(function(response) {
		$scope.listHistorys = response.data;
	});
	
});

myApp.controller('LiburCtrl', function ($scope, $http, $location, $routeParams) {
	
	$scope.params = $routeParams.param;
	// console.log( "routeParams: " + $scope.params );
	
	/*$scope.liburNas = [
		{tgl: '1 Januari', ket: 'Tahun Baru Masehi'},
		{tgl: '5 Februari', ket: 'Tahun Baru Imlek'},
		{tgl: '7 Maret', ket: 'Hari Raya Nyepi Tahun Baru Saka'},
		{tgl: '3 April', ket: 'Isra Mikraj Nabi Muhammad SAW'},
		{tgl: '19 April', ket: 'Wafat Isa Al Masih'},
		{tgl: '1 Mei', ket: 'Hari Buruh Internasional'},
		{tgl: '19 Mei', ket: 'Hari Raya Waisak'},
		{tgl: '30 Mei', ket: 'Kenaikan Isa Almasih'},
		{tgl: '1 Juni', ket: 'Hari Lahir Pancasila'},
		{tgl: '3-4 Juni', ket: 'Cuti bersama Hari Raya Idul Fitri'},
		{tgl: '5-6 Juni', ket: 'Hari Raya Idul Fitri'},
		{tgl: '7 Juni', ket: 'Cuti bersama Hari Raya Idul Fitri'},
		{tgl: '11 Agustus', ket: 'Hari Raya Idul Adha'},
		{tgl: '17 Agustus', ket: 'Hari Raya Kemerdekaan Republik Indonesia'},
		{tgl: '1 September', ket: 'Tahun Baru Islam'},
		{tgl: '9 November', ket: 'Maulid Nabi Muhammad SAW'},
		{tgl: '24 Desember', ket: 'Cuti bersama Hari Raya Natal'},
		{tgl: '25 Desember', ket: 'Hari Raya Natal'},
	];*/

	$scope.liburNas = [];
	$http.post("web/liburNas/", {
		user_id: sessionStorage.getItem('userid'),
		orderid: $scope.params
	}).then(function(response) {
		$scope.liburNas = response.data;
	});
	
});

myApp.controller('InboxCtrl', function ($scope, $http, $location, $timeout) {
	
	$scope.phonebook = [];
	$scope.inbox = [];
	/* $http.get("web/smsInbox/").then(function(response) {
		$scope.inbox = response.data;
	}); */
	
	function get_NamaPhoneBook(){
		return $http.get("web/smsInboxUser/").then(function(reply) {
			return reply.data;
		});
	}
	
	function getInbox(){
		return $http.get("web/smsInbox/").then(function(reply) {
			return reply.data;
		});
	}
	
	get_NamaPhoneBook().then(function (data) {
		$scope.phonebook = data;
	});
	
	function get_NamaPhoneBook2(phone){
		// console.log("phone:" + phone);
		/* angular.forEach($scope.phonebook, function(Obj, index){
			if(phone==Obj.Number){
				phone = Obj.Number + " (" + Obj.Name + ")";
			}
		}); */
		return phone;
	}
	
	$timeout(function() {
		getInbox().then(function (data) {
			// $scope.inbox = data;			
			angular.forEach(data, function(Obj, index){
				// if(Obj.SenderNumber){
				if (Obj.SenderNumber.indexOf("+62") !=-1) {
					Obj.SenderNumber = get_NamaPhoneBook2(Obj.SenderNumber);
				}				
				$scope.inbox.push( Obj );
			});
		});		
	}, 1000);
	
});

myApp.controller('OutboxCtrl', function ($scope, $http, $location, $timeout) {
	
	$scope.outbox = [];
	$http.get("web/smsOutbox/").then(function(response) {
		$scope.outbox = response.data;
	});
		
	/* function getOutbox(){
		return $http.get("web/smsOutbox/").then(function(reply) {
			return reply.data;
		});
	}
	
	$timeout(function() {
		getOutbox().then(function (data) {
			$scope.outbox = data;
		});		
	}, 1000); */
	
});

myApp.controller('PhoneBookCtrl', function ($scope, $http, $location) {
	
	$scope.phonebook = [];
	$scope.phonegroup = [];
	
	$http.get("web/smsInboxUser/").then(function(response) {
		$scope.phonebook = response.data;
	});
	
	$http.get("web/smsUserGroup/").then(function(response) {
		$scope.phonegroup = response.data;
	});
	
	$scope.newSms = function(addItem){
		console.log( JSON.stringify(addItem) );		
		// if (addItem.notujuan.indexOf(",") !=-1) {
			// console.log( addItem.notujuan.split(",") );
		// }
		
		if(addItem!==undefined){
			$http.post("web/smsBroadcst/",JSON.stringify(addItem)).then(function(reply) {			
				if(reply.status === 200){
					$.growl.notice({ message: reply.data.msg });
					// $scope.getuserRole();
					$scope.addItem = {};
					$scope.smsSender.$setUntouched();
					$scope.smsSender.$setPristine();
				}else{
					$.growl.error({ message: reply.data.msg });
				}
				
			},function (error) { 
				$.growl.error({ message: "Gagal Akses API >"+error });
			});
		} else {
			$.growl.error({ message: "Isi form dengan benar!." });
		}
	};
	
});

myApp.controller('CustCtrl', function ($scope, $http, $location) {
	
	$scope.listCustomers = [];
	$http.get("web/listCustomers/").then(function(response) {
		$scope.listCustomers = response.data;
	});
	
});

myApp.controller('OrderCtrl', function ($scope, $http, $location, $routeParams, $window, $timeout, $route) {
	
	String.prototype.ucfirst = function(){
		return this.charAt(0).toUpperCase() + this.substr(1);
	}
		
	$scope.userName = '';
	if(sessionStorage.getItem('user')){
		// console.info( "user: " + sessionStorage.getItem('user') );
		$scope.userName = sessionStorage.getItem('user');
	}
	
	if($routeParams.param){
		$scope.statusName = $routeParams.param;
		$scope.statusName = $scope.statusName.ucfirst();
		// console.log( "routeParams: " + $scope.statusName );
		// console.log( "routeParams: " + $scope.getStatusOrder($scope.statusName) );
	}
	
	$scope.statusOrder = [];
	/* $scope.statusOrder = [
		{id: 1, status: 'Design' },
		{id: 2, status: 'Kasir' },
		{id: 3, status: 'Indoor' },
		{id: 4, status: 'Outdoor' },
		{id: 5, status: 'A3' },
		{id: 6, status: 'Offset' },
		{id: 7, status: 'Ready' },
		{id: 8, status: 'Diambil' },
		{id: 9, status: 'Laser Cutting' },
		{id: 10, status: 'Finishing' },
		{id: 11, status: 'Lainnya' }
	]; */

	$scope.listOrders = [];
	function getStatusOrder(){
		return $http.get("web/listStatusOrder/").then(function(reply) {
			// console.info("listStatusOrder: "+JSON.stringify(reply));
			return reply.data;
		});
	}

	getStatusOrder().then(function (data) {
	    // console.log( " listStatusOrder: " + JSON.stringify(data));
	    // console.log( " statusName: " + $scope.statusName);
		$scope.statusOrder = data;	
		$scope.selectStatusOrder = function(val){
			// console.info( "orderstatus:" + JSON.stringify(val) );
			// var statusOrderSelected = val;
			/* angular.forEach($scope.statusOrder, function(Obj, index){
				if(val==Obj.status){
					console.info( Obj );
					statusOrderSelected = Obj.id;
				}
			}); */
			return val;
		}
		
		// console.log( "status: " + $scope.statusName );
		$http.post("web/listOrder/", {
			user_id: sessionStorage.getItem('userid'),
			status: parseInt($scope.statusName),
			// status: $scope.selectStatusOrder( parseInt($scope.statusName) )
		}).then(function(response) {
			
			$scope.listOrders = response.data;
		},function (error) { 
			$.growl.error({ message: "Gagal Akses API >"+error });
		});

	}, function (error) {
	    console.error(data);
	})
	
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
	
		/* $scope.getStatusOrder2 = function(val){
			console.info( "orderstatus2: " + val );
			var statusOrderSelected = 0;
			angular.forEach($scope.statusOrder, function(Obj, index){
				if(val==Obj.status){
					// console.info( Obj );
					statusOrderSelected = Obj.id;
				}
			});
			return statusOrderSelected;
		} */
	
	$scope.saveOrderStatus = function(so, newso){
		// console.info( "New Status : " + JSON.stringify(newso.status) );		
		if (newso.status === "Diambil") {
            if (confirm("Apakah anda yakin?")){
				// console.log("OK");
			} else{
				return false;
			}
        }
		
		var dataSend = {
			user_id: sessionStorage.getItem('userid'),
			user_level: sessionStorage.getItem('level'),
			orderid: so.orderid,
			// orderstatus: newso.name
			orderstatus: newso
		};
		
		$http.post("web/updtOrderStatus/", dataSend).then(function(reply) {
			// console.info(reply);
			if(reply.status === 200){
				$.growl.notice({ message: reply.data.msg });
				$timeout(function() {
					$route.reload();
				}, 1000);
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
	function getListUsers(){
		return $http.get("web/listUsers/" + $scope.id).then(function(response) {
			return response.data;
		});
	}
	
	getListUsers().then(function(data) {
		// console.info("listUsers: "+JSON.stringify(data));
		var usr = data[0];
		$scope.user = {
			display_name: usr.name, email: usr.email, password: usr.password, level: usr.level
		};
		// console.info("user: " + $scope.user);
	});
	
	$scope.updateUser = function(user){
		console.info('Update User : ' + JSON.stringify(user));
		
		$http.post("web/updateUsr/", {
			user_id: sessionStorage.getItem('userid'),
			user_level: sessionStorage.getItem('level'),
			user_editid: $scope.id,
			data: user
		}).then(function(reply) {		
			// $scope.listOrders = response.data;
			if(reply.status === 200){
				console.info("reply: "+JSON.stringify(reply));
				if(!reply.data.error){
					$.growl.notice({ message: reply.data.msg });
					// $scope.loadUsers();
				} else{
					$.growl.error({ message: reply.data.msg });
				}
			}
		},function (error) { 
			$.growl.error({ message: "Gagal Akses API >"+error });
		});
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
	
	// $scope.loadUsers();
});

myApp.controller('KasirCtrl', function ($scope, $http, $location) {
	
	$scope.formatDate = function(date){
		// console.info( date );
		var dateOut = new Date(date);
		return dateOut;
	};
	
	$scope.userName = '';
	if(sessionStorage.getItem('user')){
		// console.info( "user: " + sessionStorage.getItem('user') );
		$scope.userName = sessionStorage.getItem('user');
	}
		
	$scope.listOrders = [];	
	/* $scope.loadOrder = function(){
		$http.post("web/listOrder/", {
			user_id: sessionStorage.getItem('userid'),
			user_level: sessionStorage.getItem('level'),
			// params: $scope.params
		}).then(function(response) {		
			$scope.listOrders = response.data;
		},function (error) { 
			$.growl.error({ message: "Gagal Akses API >"+error });
		});
	}; */
	
	$scope.statusOrder = [];
	/* $scope.statusOrder = [
		{id: 1, status: 'Design' },
		{id: 2, status: 'Kasir' },
		{id: 3, status: 'Indoor' },
		{id: 4, status: 'Outdoor' },
		{id: 5, status: 'A3' },
		{id: 6, status: 'Offset' },
		{id: 7, status: 'Ready' },
		{id: 8, status: 'Diambil' },
		{id: 9, status: 'Laser Cutting' },
		{id: 10, status: 'Finishing' },
		{id: 11, status: 'Lainnya' }
	]; */
	
	function getStatusOrder(){
		return $http.get("web/listStatusOrder/").then(function(reply) {
			// console.info("listStatusOrder: "+JSON.stringify(reply));
			return reply.data;
		});
	}

	getStatusOrder().then(function (data) {
	    // console.log( "statusOrder: " + JSON.stringify(data) );
		$scope.statusOrder = data;
	
		$scope.getStatusOrder = function(val){
			// console.info( "orderstatus:" + val );
			var statusOrderSelected = 0;
			angular.forEach($scope.statusOrder, function(Obj, index){
				if(val==Obj.status){
					// console.info( Obj );
					statusOrderSelected = Obj.id;
				}
			});
			return statusOrderSelected;
		}

		$http.post("web/listOrder/", {
			user_id: sessionStorage.getItem('userid'),
			status: $scope.getStatusOrder($scope.statusName)
		}).then(function(response) {
			
			$scope.listOrders = response.data;
		},function (error) { 
			$.growl.error({ message: "Gagal Akses API >"+error });
		});

	}, function (error) {
	    console.error(data);
	})
	
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
				// $scope.loadOrder();
			}else{
				$.growl.error({ message: reply.data.msg });
			}
			
		},function (error) { 
			$.growl.error({ message: "Gagal Akses API >"+error });
		});
	}
	
	$scope.saveOrderStatus = function(so, newso){
		// console.info('Sales Order : ', so);
		console.info( "New Status : " + JSON.stringify(newso.id) );
		
		var dataSend = {
			user_id: sessionStorage.getItem('userid'),
			user_level: sessionStorage.getItem('level'),
			orderid: so.orderid,
			orderstatus: newso
		};
		
		$http.post("web/updtOrderStatus/", dataSend).then(function(reply) {
			console.info(reply);
			if(reply.status === 200){
				$.growl.notice({ message: reply.data.msg });
				// $scope.loadOrder();
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
			$location.path('/mykasir');
		}
		
		$scope.disubmit = 0;
		$scope.addItem = {};
		$scope.myOrder = [{
			item: '', jml: '', ddline: '', ket: ''
		}];
		$scope.randomId = Math.random();
		
		$scope.searchNama = function(){
			$scope.userMemoList = [];
			if($scope.addItem.nama.length>=3) {
				$http.get("web/listCustomers/?terms=" + $scope.addItem.nama).then(function(reply) {
					angular.forEach(reply.data, function(Obj, index){
						$scope.userMemoList.push( Obj );
					});
				});
			}
		}
		
		$scope.selectedUser = function(item){
			if(item!==undefined && $scope.userMemoList!==null) {
				$scope.addItem.mobile = parseInt($scope.userMemoList[0]['hp']);
				$scope.addItem.email = $scope.userMemoList[0]['email'];
				$scope.addItem.alamat = $scope.userMemoList[0]['alamat'];
			}
		}

		/*$scope.searchItem = function(){

			if($scope.addItem.item.length>=3) {
				$scope.itemList = [];
				$http.get("web/listOrderItem/?terms=" + $scope.addItem.item).then(function(reply) {
					angular.forEach(reply.data, function(Obj, index){
						$scope.itemList.push( Obj );
					});
				});
				console.log($scope.itemList);
			}
		}*/

		$scope.getOrderItem = function(){
			$scope.itemList = [];
			$http.get("web/listOrderItem").then(function(reply) {
				angular.forEach(reply.data, function(Obj, index){
					$scope.itemList.push( Obj );
				});
			});
			// console.log($scope.itemList);
		}
		
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
			// console.info("posting: "+JSON.stringify(addItem));
			
			$http.post("web/addOrder/",JSON.stringify(addItem)).then(function(reply) {
				// console.info("reply: "+JSON.stringify(reply));				
				if(reply.status === 200){
					// console.info("reply: "+ angular.toJson(reply));
					// if(!reply.data.error){
						$scope.loadOrder();
						$.growl.notice({ message: reply.data.msg });
						// $.growl({ title: "Tambah Order", message: reply.data.msg });
					// } else{
						// $.growl.error({ message: reply.data.msg });
					// }
					$scope.disubmit += 1;
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
		// console.info( "loggedIn: " + JSON.stringify(sessionStorage) );
	}
	
	editableOptions.theme = 'bs3'; // bootstrap3 theme. Can be also 'bs2', 'default'
	
	$rootScope.$on('$locationChangeStart', function (event, next, current) {
		// redirect to login page if not logged in
		// if ($location.path() !== '/home' && sessionStorage.loggedIn !='true') {
		if (sessionStorage.loggedIn !='true') {
			$location.path('/home');
		}
	});
	
	$rootScope.$on('$routeChangeSuccess', function (event, current, previous) {
        // console.log ( current.$$route.title );
        // if(current.$$route.title) $rootScope.title = current.$$route.title;
        // document.title = current.$$route.title;

        $rootScope.randomId = Math.random();
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

myApp.directive('list', function() {
  return {
    restrict: 'A',
    require: '?ngModel',
    link: function(s, e, attr, ctrl) {
      if (ctrl && e[0].nodeName === 'INPUT') {
        // console.log('do');
        e.data('ngModelName', attr.ngModel);
      }
    }
  }
});

myApp.directive('datalist', function($compile) {
  var supportsDatalist = !!('list' in document.createElement('input')) && 
            !!(document.createElement('datalist') && window.HTMLDataListElement);
  
  return {
    restrict: 'E',
    transclude: true,
    link: function(s, e, a, c, t) {
      if (!supportsDatalist) {
        var listId = a.id;
        //Assumes inputs that use datalist are unique. A better directive would probably include the input itself
        var input = document.querySelectorAll("input[list="+ listId +"]")
        input = input[0];
        
        var ngModelName = angular.element(input).data('ngModelName');
        
        var select = $compile('<select ng-model="'+ngModelName+'"></select>')(s);
        
        e.append(select);
        
        e = select;
      }
      
      t(function(te) {
        e.append(te);
      })
    }
  }
});