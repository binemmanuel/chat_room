<?php


require __DIR__ . '/../vendor/autoload.php';

use PHPSocketIO\Socket;
use PHPSocketIO\SocketIO;
use Workerman\Worker;

$io = new SocketIO(8080);

// Listen for connections to the server
$io->on('connection', function (Socket $socket) {
});

Worker::runAll();
