<?php

define( 'DB_NAME', 'wordpress' );

define( 'DB_USER', 'silim' );

define( 'DB_PASSWORD', 'silim' );

define( 'DB_HOST', 'mariadb:3306' );

define( 'DB_CHARSET', 'utf8' );

define( 'DB_COLLATE', '' );

define('AUTH_KEY', '3%L>7>zw<W%[H-lx(S+JJb+c0{;U-dr+|Sw>V+5fc[WU>r+M)Eq[|6( s^.xd=}h=');
define('SECURE_AUTH_KEY', 'zkNHcR=TU,T%_qr@ukI]KB=G4Lxla.h@Ozyl{zlq|Am#%Gbmv.<I%A*+X^pJ0BX[');
define('LOGGED_IN_KEY', '8R#oWOP-#foXA:rZGNDl~?ro1?fPnO|}cLI>+YA|%EA#$<rntil.6v7gC 1{K;MU');
define('NONCE_KEY', 'ku>qw3?8ilq3|PIkWfE*GaVCGArYps*tJ~gz =|U29fs%{}pp|kG8h:Flr@.?&ez');
define('AUTH_SALT', 'ECqWL#wi0GaOD2[Pp-(gM@Q>eE+J:#qYM}x2wlq53[s+]?i,,_$-jg=eaL5><L++');
define('SECURE_AUTH_SALT', 'X5-wXt7&%w+VyV-]en_NtDS$Z[&qRIshoq{xl[q35R.7gm#/-fR@0TVNALM(Y~=*');
define('LOGGED_IN_SALT', '&wyzz$0#~M3+3.=.eLxM]]C@6=piJ2&q{EESFI&!h-ZIB2:2)U5~zR[bg#vKhlh]');
define('NONCE_SALT', 'EPv{~sPM({~nOt<M=GG{[y/7{|0^,l@(Y|=m8my+/<_KxCulkpvQtAR+dPDt<FYz');

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
