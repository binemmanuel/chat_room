<?php


require __DIR__ . '/../vendor/autoload.php';

use PHPSocketIO\Socket;
use PHPSocketIO\SocketIO;
use Workerman\Worker;

$io = new SocketIO(8081);

// Listen for connections to the server
$io->on('connection', function ($socket) {
});

Worker::runAll();
