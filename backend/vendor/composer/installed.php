<?php return array(
    'root' => array(
        'name' => 'chat_room/backend',
        'pretty_version' => '1.0.0+no-version-set',
        'version' => '1.0.0.0',
        'reference' => NULL,
        'type' => 'project',
        'install_path' => __DIR__ . '/../../',
        'aliases' => array(),
        'dev' => true,
    ),
    'versions' => array(
        'chat_room/backend' => array(
            'pretty_version' => '1.0.0+no-version-set',
            'version' => '1.0.0.0',
            'reference' => NULL,
            'type' => 'project',
            'install_path' => __DIR__ . '/../../',
            'aliases' => array(),
            'dev_requirement' => false,
        ),
        'workerman/channel' => array(
            'pretty_version' => 'dev-master',
            'version' => 'dev-master',
            'reference' => 'fbfb81c7ebc5858c4053f226cbb5d15fe670ff6e',
            'type' => 'library',
            'install_path' => __DIR__ . '/../workerman/channel',
            'aliases' => array(
                0 => '9999999-dev',
            ),
            'dev_requirement' => false,
        ),
        'workerman/phpsocket.io' => array(
            'pretty_version' => 'v1.1.16',
            'version' => '1.1.16.0',
            'reference' => 'f4dc14e69e9d0d8ce69c6180f93b76b7743f2304',
            'type' => 'library',
            'install_path' => __DIR__ . '/../workerman/phpsocket.io',
            'aliases' => array(),
            'dev_requirement' => false,
        ),
        'workerman/workerman' => array(
            'pretty_version' => 'dev-master',
            'version' => 'dev-master',
            'reference' => 'b9d540d751ded63ee9db2adf3098d144dbb63edc',
            'type' => 'library',
            'install_path' => __DIR__ . '/../workerman/workerman',
            'aliases' => array(
                0 => '9999999-dev',
            ),
            'dev_requirement' => false,
        ),
    ),
);
