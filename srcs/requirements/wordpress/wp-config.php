<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'kyukim' );

/** MySQL database password */
define( 'DB_PASSWORD', 'kim13245' );

/** MySQL hostname */
define( 'DB_HOST', '172.18.0.2:3306' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '_TEyNXGxXXSMtst<2GFm%uI*:Z6t7$m_>JE_eG,%;o|z1wJ//2iu]v<6U&U?F6DQ' );
define( 'SECURE_AUTH_KEY',  '!Hek6n[abD#U&o*TI%;:yIcBfO}]5t1*%<,!x}48 F==]Nz,Oef/+8!({Or70.K9' );
define( 'LOGGED_IN_KEY',    'x8l1_|wC;j4d^$#;_5;R!St#O|k=Z@E;c+`(-I72Y=u)E|,n$0 XKgsj:Bh||L!;' );
define( 'NONCE_KEY',        'i.9sw+XC2[hz^1[Bqz$<FoNo`;(waz-@YfgESFJD>Mog@,K[LEegN<45YYVo<m`y' );
define( 'AUTH_SALT',        '^v~JneY1qrqY;/eSGOJmd|8c!<Xz?c24<rB>dLX|*o+HT|!t%lEig?F/VBS=Uco=' );
define( 'SECURE_AUTH_SALT', '1kvmOvBppUyo~.;6#e<+p`G|L>(OcS+5pOAAa;7P,]c r|<.vlwEY|GgD;(o[mS#' );
define( 'LOGGED_IN_SALT',   'Hdcu_G2ld#^8AhHZ/QA^4nou.U.ker_A|7f-fus-&rncdk/(QL*j;jL,V+jm*fm3' );
define( 'NONCE_SALT',       'e[Q[mB=/_Kv(46{$SUoq,0 nnU52X6Rvi!l`CTzE*86}ZP,5gn5xma(&S*,|;VRC' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
