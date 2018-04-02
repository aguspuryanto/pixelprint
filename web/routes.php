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
		'namacustomer' => $paramData['nama']
	);
	
	$count = DB::table('wp0e_pxmycustomer')->where('namacustomer', $paramData['nama'])->count();
	if($count == 0){
		$insertCustomer = DB::table('wp0e_pxmycustomer')->insert($dataCustomer);
	}
	
	$pxmyorder = DB::table('wp0e_pxmyorder')
		->where('nomorso', $paramData['noso'])
		->where('orderitem', $paramData['item'])
		->get();
	// echo $count;
	
	if(count($pxmyorder) <= 0){
		
		$orderdeadline = $paramData['ddline'] . " " . date("H:i:s");
		$orderdate = $paramData['tglorder'] . " " . date("H:i:s");
		
		$dataOrder = array(
			'nomorso' => $paramData['noso'],
			'namapelanggan' => $paramData['nama'],
			'orderitem' => $paramData['item'],
			'orderjml' => $paramData['jml'],
			'orderketerangan' => $paramData['ket'],
			'orderdeadline' => date("Y-m-d H:i:s", strtotime($orderdeadline)),
			'orderdate' => date("Y-m-d H:i:s", strtotime($orderdate)),
			'orderstatus' => 'Design'
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

$app->post('/listOrder[/]', function ($request, $response, $args) {
	
	$paramData = $request->getParsedBody();
	// return $response->withJson($paramData); die();
	
	$result = DB::table("wp0e_pxmyorder");		
	if($paramData['user_id']>1){
		$result = $result->where('orderopr', $paramData['user_id']);
	}	
	$result = $result->orderBy('orderid', 'DESC')->get();
	// return $response->withJson( toDebug($result) );
	
	return $response->withStatus(200)
        ->withHeader('Content-Type', 'application/json')
        ->write($result);
});

$app->get('/listUsers[/]', function ($request, $response, $args) {
	
	$tokenAuth = $request->getHeader('Authorization');
	if($tokenAuth){
		$result = DB::table("wp0e_pxusers")->orderBy('id', 'DESC')->get();
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

$app->get('/listCustomers[/]', function ($request, $response, $args) {
	$result = DB::table("wp0e_pxmycustomer")->orderBy('idcust', 'DESC')->get();
	
	return $response->withStatus(200)
        ->withHeader('Content-Type', 'application/json')
        ->write($result);
});


function toDebug($builder){
		
	$sql = $builder->toSql();
	foreach ( $builder->getBindings() as $binding ) {
		$value = is_numeric($binding) ? $binding : "'".$binding."'";
		$sql = preg_replace('/\?/', $value, $sql, 1);
	}
	return $sql;
}