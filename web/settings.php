<?php
return [
    'settings' => [
		'debug' => false,
		'determineRouteBeforeAppMiddleware' => false,
        'displayErrorDetails' => true, // set to false in production
        'addContentLengthHeader' => false, // Allow the web server to send the content-length header
		'db' => [
            'driver' => 'mysql',
            'host' => 'localhost',
            'database' => 'pixelprint',
            'username' => 'root',
            'password' => '103Wonokromo',
            'charset'   => 'utf8',
            'collation' => 'utf8_unicode_ci',
            'prefix'    => '',
        ]
    ],
];
