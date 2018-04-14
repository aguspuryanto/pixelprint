<?php

use Illuminate\Database\Capsule\Manager as DB;
// use Illuminate\Database\Eloquent\Model;

$app->post('/login[/]', function ($request, $response, $args) {
	
	$inputEmail = $request->getParam('inputEmail');
	$inputPassword = $request->getParam('inputPassword');	
	// $result = $request->getBody();
	
	$result = DB::table("wp0e_pxusers")
		->where('email', '=', $inputEmail)
		->where('password', '=', $inputPassword)
		->get();
		
	return $response->withStatus(200)
        ->withHeader('Content-Type', 'application/json')
        ->write($result);
});

$app->post('/addUser[/]', function ($request, $response, $args) {
	
	$paramData = $request->getParsedBody();
	// return $response->withJson($paramData);
	
	$dataUser = array(
		'name' => $paramData['display_name'],
		'email' => $paramData['email'],
		'password' => $paramData['password'],
		'remember_token' => bin2hex(openssl_random_pseudo_bytes(8)), //generate a random token,
		'level' => $paramData['level'],
		'created_at' => date("Y-m-d H:i:s"),
		'updated_at' => date("Y-m-d H:i:s"),
	);
	
	$count = DB::table('wp0e_pxusers')->where('email', $paramData['email'])->count();
	// return $response->withJson($count);	
	$result = array();
	if($count==0){
		try {
			$insertUser = DB::table('wp0e_pxusers')->insert($dataUser);			
			$result["error"] = false;
			$result["msg"] = "Data Tersimpan";
		} catch(\Illuminate\Database\QueryException $e){
			// do what you want here with $e->getMessage();
			$result["error"] = true;
			$result["msg"] = "Gagal simpan data. " . $e->getMessage();
		}
	} else{
		$result["error"] = true;
		$result["msg"] = "Gagal simpan data.";
	}
	
	return $response->withStatus(200)
        ->withHeader('Content-Type', 'application/json')
        ->write(json_encode($result));
	
});

$app->post('/addOrder[/]', function ($request, $response, $args) {
	
	$paramData = $request->getParsedBody();
	// echo json_encode($paramData);
	
	$dataCustomer = array(
		'namacustomer' => $paramData['nama'],
		'hp' => $paramData['mobile'],
		'email' => $paramData['email'],
		'alamat' => $paramData['alamat']
	);
	
	$count = DB::table('wp0e_pxmycustomer')
		->where('email', $paramData['email'])
		->where('hp', $paramData['hp'])
		->count();
		
	if($count == 0){
		$insertCustomer = DB::table('wp0e_pxmycustomer')->insert($dataCustomer);
	}
	
	/* $getnomorso = DB::table('wp0e_pxmyorder')
		->select('nomorso')->where('nomorso', $paramData['noso'])
		->get(); */
	
	$pxmyorder = DB::table('wp0e_pxmyorder')
		->where('namapelanggan', $paramData['nama'])
		->where('orderitem', $paramData['item'])
		->count();
	// echo $count;	
	
	if($pxmyorder == 0){
		
		$ddtime = date("H:i:s", strtotime($paramData['ddtime']));
		$orderdeadline = $paramData['ddline'];
		// $orderdate = $paramData['tglorder'] . " " . date("H:i:s");
	
		$number = DB::table('wp0e_pxmyorder')->count()+1;
		$nomorso = str_pad($number, 9, "0", STR_PAD_LEFT);  //00002
		
		$dataOrder = array(
			// 'nomorso' => $nomorso,
			'namapelanggan' => $paramData['nama'],
			'orderitem' => $paramData['item'],
			'orderjml' => $paramData['jml'],
			'orderketerangan' => $paramData['ket'],
			'orderdeadline' => date("Y-m-d H:i:s", strtotime($orderdeadline)),
			'orderdate' => date("Y-m-d H:i:s"),
			'orderstatus' => 1,
			'orderopr' => $paramData['opr']
		);	
		$insertOrder = DB::table('wp0e_pxmyorder')->insert($dataOrder);
	}
	
	if(!$insertOrder){
		$result["error"] = true;
        $result["msg"] = "Gagal simpan data";
	}else{
		$result["error"] = false;
        $result["msg"] = "Data Tersimpan";
	}
	
	// return $response->withJson($result);
	
	// $result = DB::table("fasilitas")->get();
	return $response->withStatus(200)
        ->withHeader('Content-Type', 'application/json')
        ->write(json_encode($result));
});

$app->post('/updtOrder[/]', function ($request, $response, $args) {

	$paramData = $request->getParsedBody();
	// return $response->withJson($paramData);
	$updateOrder = DB::table("wp0e_pxmyorder")
		->where('orderid', $paramData['orderid'])
		->update(['nomorso' => $paramData['nomorso']]);
		
	$insertLogger = DB::table('wp0e_pxlog')->insert(array(
		'orderid' => $paramData['orderid'],
		'update' => date("Y-m-d H:i:s"),
		'operator' => $paramData['user_id'],
		'ket' => 'New StatusOrder : '.$paramData['nomorso'],
	));
		
	if(!$updateOrder){
		$result["error"] = true;
        $result["msg"] = "Gagal simpan data";
	}else{
		$result["error"] = false;
        $result["msg"] = "Data Tersimpan";
	}
	
	return $response->withStatus(200)
        ->withHeader('Content-Type', 'application/json')
        ->write(json_encode($result));
});

$app->post('/updtOrderStatus[/]', function ($request, $response, $args) {

	$paramData = $request->getParsedBody();
	// return $response->withJson($paramData);
	
	$updateOrder = DB::table("wp0e_pxmyorder")
		->where('orderid', $paramData['orderid'])
		->update(['orderstatus' => $paramData['orderstatus_id']]);
		
	$insertLogger = DB::table('wp0e_pxlog')->insert(array(
		'orderid' => $paramData['orderid'],
		'update' => date("Y-m-d H:i:s"),
		'operator' => $paramData['user_id'],
		'ket' => 'New StatusOrder : '.$paramData['orderstatus'],
	));
		
	if(!$updateOrder){
		$result["error"] = true;
        $result["msg"] = "Gagal simpan data";
	}else{
		$result["error"] = false;
        $result["msg"] = "Data Tersimpan";
	}
	
	return $response->withStatus(200)
        ->withHeader('Content-Type', 'application/json')
        ->write(json_encode($result));
});

$app->post('/listOrder[/]', function ($request, $response, $args) {
	
	$paramData = $request->getParsedBody();
	// return $response->withJson($paramData); die();

	$qry = "select a.*, b.name as oprname, c.status as ordstatus from wp0e_pxmyorder a
		left join wp0e_pxusers b on b.id=a.orderopr
		left join wp0e_pxstatusorder c on c.id=a.orderstatus";
		
	if($paramData['status']){
		$qry .= " where orderstatus = '".ucwords($paramData['status'])."'";
	} else{
		$qry .= " where orderstatus !=8 and MONTH(orderdate) = '".date('m')."'";
	}
	
	$qry .= " order by orderid desc";
	
	$result = DB::select(DB::raw($qry));
	return $response->withStatus(200)
        ->withHeader('Content-Type', 'application/json')
        ->write(json_encode($result));
});

$app->post('/updateUsr[/]', function ($request, $response, $args) {
	$paramData = $request->getParsedBody();
	// return $response->withJson($paramData); die();
	
	// enable the query log
	DB::enableQueryLog();

	$updateUser = DB::table("wp0e_pxusers")
		->where('id', $paramData['user_editid'])
		->update([
			'name' => $paramData['data']['display_name'],
			'password' => $paramData['data']['password'],
			'level' => $paramData['data']['level']
		]);
	
	// view the query log
	// dd(DB::getQueryLog()); die();	
	$insertLogger = DB::table('wp0e_pxlog')->insert(array(
		'orderid' => 0,
		'update' => date("Y-m-d H:i:s"),
		'operator' => $paramData['user_id'],
		'ket' => 'Update User : '.$paramData['data']['display_name'],
	));
		
	if(!$updateUser){
		$result["error"] = true;
        $result["msg"] = "Gagal simpan data";
	}else{
		$result["error"] = false;
        $result["msg"] = "Data Tersimpan";
	}
	
	return $response->withStatus(200)
        ->withHeader('Content-Type', 'application/json')
        ->write(json_encode($result));
		
});

$app->post('/deleteOrder[/]', function ($request, $response, $args) {
	$paramData = $request->getParsedBody();
	// return $response->withJson($paramData); die();
	
	$tokenAuth = $request->getHeader('Authorization');
	// return $response->withJson($tokenAuth); die();
	if($tokenAuth){
		$deleteUsr = DB::table('wp0e_pxmyorder')->where('orderid', '=', $paramData['orderid'])->delete();		
		$result["error"] = false;
        $result["msg"] = "Order Telah Terhapus";
		
		$insertLogger = DB::table('wp0e_pxlog')->insert(array(
			'orderid' => 0,
			'update' => date("Y-m-d H:i:s"),
			'operator' => $paramData['user_id'],
			'ket' => 'Delete Order : '.$paramData['orderid'],
		));
		
	} else{
		$result["error"] = true;
		$result["msg"] = "No Authorization";
	}
	
	$result = json_encode($result);
	return $response->withStatus(200)
        ->withHeader('Content-Type', 'application/json')
        ->write($result);
	
});

/* $app->post('/updateUsr[/]', function ($request, $response, $args) {
	$paramData = $request->getParsedBody();
	// return $response->withJson($paramData); die();
	
	// enable the query log
	DB::enableQueryLog();

	$updateUser = DB::table("wp0e_pxusers")
		->where('id', $paramData['user_editid'])
		->update([
			'name' => $paramData['data']['display_name'],
			'password' => $paramData['data']['password'],
			'level' => $paramData['data']['level']
		]);
	
	// view the query log
	// dd(DB::getQueryLog()); die();	
	$insertLogger = DB::table('wp0e_pxlog')->insert(array(
		'orderid' => 0,
		'update' => date("Y-m-d H:i:s"),
		'operator' => $paramData['user_id'],
		'ket' => 'Update User : '.$paramData['data']['display_name'],
	));
		
	if(!$updateUser){
		$result["error"] = true;
        $result["msg"] = "Gagal simpan data";
	}else{
		$result["error"] = false;
        $result["msg"] = "Data Tersimpan";
	}
	
	return $response->withStatus(200)
        ->withHeader('Content-Type', 'application/json')
        ->write(json_encode($result));
		
}); */

$app->post('/deleteUsr[/]', function ($request, $response, $args) {
	$paramData = $request->getParsedBody();
	// return $response->withJson($paramData); die();
	
	$tokenAuth = $request->getHeader('Authorization');
	// return $response->withJson($tokenAuth); die();
	if($tokenAuth){
		$deleteUsr = DB::table('wp0e_pxusers')->where('id', '=', $paramData['delete_id'])->delete();		
		$result["error"] = false;
        $result["msg"] = "User Telah Terhapus";
	} else{
		$result["error"] = true;
		$result["msg"] = "No Authorization";
	}
	
	$result = json_encode($result);
	return $response->withStatus(200)
        ->withHeader('Content-Type', 'application/json')
        ->write($result);
	
});

$app->get('/listUsers[/[{id}]]', function ($request, $response, $args) {
	
	// echo json_encode($args['id']);
	$tokenAuth = $request->getHeader('Authorization');
	if($tokenAuth){
		if($args['id']){
			$result = DB::table("wp0e_pxusers")->where('id', '=', $args['id'])->get();
		}else {
			$result = DB::table("wp0e_pxusers")->orderBy('id', 'DESC')->get();
		}
		
	} else{
		$result["error"] = true;
		$result["msg"] = "No Authorization";
	}
	
	return $response->withStatus(200)
        ->withHeader('Content-Type', 'application/json')
        ->write($result);
});

/* $app->get('/listOrders[/]', function ($request, $response, $args) {
	$result = DB::table("wp0e_pxmyorder")->orderBy('orderid', 'DESC')->get();
	
	return $response->withStatus(200)
        ->withHeader('Content-Type', 'application/json')
        ->write($result);
}); */

$app->get('/listStatusOrder[/]', function ($request, $response, $args) {
	$result = DB::table("wp0e_pxstatusorder")->orderBy('id', 'ASC')->get();
	
	return $response->withStatus(200)
        ->withHeader('Content-Type', 'application/json')
        ->write($result);
});

$app->post('/addStatusOrder[/]', function ($request, $response, $args) {
	$paramData = $request->getParsedBody();
	// return $response->withJson($paramData); die();
	$statusOrder = array(
		'status' => $paramData['orderstatus']
	);
	
	$insertLogger = DB::table('wp0e_pxlog')->insert(array(
		'orderid' => 0, //Setting Page
		'update' => date("Y-m-d H:i:s"),
		'operator' => $paramData['user_id'],
		'ket' => 'New StatusOrder : '.$paramData['orderstatus'],
	));
	
	$insertStatusOrder = DB::table('wp0e_pxstatusorder')->insert($statusOrder);	
	if($insertStatusOrder){
		$result["error"] = false;
        $result["msg"] = "Data Tersimpan";
	}else{
		$result["error"] = true;
        $result["msg"] = "Gagal simpan data";
	}
	
	return $response->withStatus(200)
        ->withHeader('Content-Type', 'application/json')
        ->write(json_encode($result));
});

$app->get('/userRole[/]', function ($request, $response, $args) {
	$result = DB::table("wp0e_pxusersrole")->orderBy('id', 'DESC')->get();
	
	return $response->withStatus(200)
        ->withHeader('Content-Type', 'application/json')
        ->write($result);
});

$app->post('/adduserRole[/]', function ($request, $response, $args) {
	$paramData = $request->getParsedBody();
	// return $response->withJson($paramData); die();
	$userRole = array(
		'id_role' => $paramData['levelid'],
		'user_role' => $paramData['leveluser']
	);
	
	$insertLogger = DB::table('wp0e_pxlog')->insert(array(
		'orderid' => $paramData['orderid'],
		'update' => date("Y-m-d H:i:s"),
		'operator' => $paramData['user_id'],
		'ket' => 'New userRole : '.$paramData['orderstatus'],
	));
	
	$insertuserRole = DB::table('wp0e_pxusersrole')->insert($userRole);	
	if($insertuserRole){
		$result["error"] = false;
        $result["msg"] = "Data Tersimpan";
	}else{
		$result["error"] = true;
        $result["msg"] = "Gagal simpan data";
	}
	
	return $response->withStatus(200)
        ->withHeader('Content-Type', 'application/json')
        ->write(json_encode($result));
});

$app->get('/listCustomers[/]', function ($request, $response, $args) {
	$result = DB::table("wp0e_pxmycustomer")->orderBy('idcust', 'DESC')->get();
	
	return $response->withStatus(200)
        ->withHeader('Content-Type', 'application/json')
        ->write($result);
});

$app->post('/listHistory[/]', function ($request, $response, $args) {
	
	$paramData = $request->getParsedBody();
	// return $response->withJson($paramData); die();
	
	$qry = "select a.*,b.nomorso,b.namapelanggan,c.name from wp0e_pxlog a
		left join wp0e_pxmyorder b on b.orderid = a.orderid
		left join wp0e_pxusers c on c.id = a.operator";
		
	if($paramData['orderid']){
		$qry .= " where a.orderid ='".$paramData['orderid']."'";
	}		
	$qry .= " order by a.id desc";
	
	$result = DB::select(DB::raw($qry));
	
	return $response->withStatus(200)
        ->withHeader('Content-Type', 'application/json')
        ->write(json_encode($result));
});

function toDebug($builder){
		
	$sql = $builder->toSql();
	foreach ( $builder->getBindings() as $binding ) {
		$value = is_numeric($binding) ? $binding : "'".$binding."'";
		$sql = preg_replace('/\?/', $value, $sql, 1);
	}
	return $sql;
}