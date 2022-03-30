<?php

define( 'DB_NAME', getenv('WP_NAME') );

define( 'DB_USER', getenv('WP_USER') );

define( 'DB_PASSWORD', getenv('WP_PASSWORD') );

define( 'DB_HOST', getenv('WP_HOST') );

define( 'DB_CHARSET', 'utf8' );

define( 'DB_COLLATE', '' );

define( 'AUTH_KEY',         'fiea[c+O+7#fzAceF)|uPY]D)lZJ3Di12;7;l6c2+<ET)(355Z(MVRZ]6u3OKu87' );
define( 'SECURE_AUTH_KEY',  '}W_{|fcQb{(VE;mTyXGE80W-Mvkc)4|qE91+6$H2w),;^9]oC]hY|v>ItE-UuQ[;' );
define( 'LOGGED_IN_KEY',    'j2ADH=Am7dx_-RyACrr;A9P(@!-w}SL5N+O1TJU1 n/)x^%e5DIH-1f/(fH5|aJG' );
define( 'NONCE_KEY',        'j}Ci`C%0m}m=KcQhD@)Y9dIJ2ASJY5Yi6L]q&=,nf/QM7;m9QMm{*rx}n+Yu$Of9' );
define( 'AUTH_SALT',        'dfl=.0q CepI.JJ ;(A@&G+cJj;f/<XS0W-8*6G1i8~)PZ2y[_[ko:|N1+AQDM1|' );
define( 'SECURE_AUTH_SALT', '-Y=L( V;&h*|1/+*g^XdByBMvHbGczU+lW MX!X5N)r3lp?Vb*+gE+HQjZS},S_q' );
define( 'LOGGED_IN_SALT',   '0KtC]!%]8?4}>Kb^?CN-^/-*1v[Ybm/i <#UhXQIerxmNFm:`GA{sQ^Ta)l[MkWv' );
define( 'NONCE_SALT',       'S|b4anU25E4+|nT:_&_Qa4BI-`|d)@;$BFrCF?a .Ze#^+C2+{EO>Kzs?2vT(7;8' );

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
