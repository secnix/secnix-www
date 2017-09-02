<?php

add_theme_support( 'post-thumbnails' ); //Adds thumbnails compatibility to the theme
set_post_thumbnail_size( 300, 300, true ); // Sets the Post Main Thumbnails
add_image_size( 'custom-size', 600, 600 );

function SECNIX_HTML_TO_WORDPRESS_STYLES () {
wp_enqueue_style( 'bootstrap_material_css' , get_template_directory_uri() . '/assets/bootstrap-material-design-font/css/material.css' );
wp_enqueue_style( 'et-line-font_css' , get_template_directory_uri() . '/assets/et-line-font-plugin/style.css' );
wp_enqueue_style( 'mobirise-icons_css' , get_template_directory_uri() . '/assets/web/assets/mobirise-icons/mobirise-icons.css' );
wp_enqueue_style( 'tether_css' , get_template_directory_uri() . '/assets/tether/tether.min.css' );
wp_enqueue_style( 'bootstrap_css' , get_template_directory_uri() . '/assets/bootstrap/css/bootstrap.min.css' );
wp_enqueue_style( 'dropdown_css' , get_template_directory_uri() . '/assets/dropdown/css/style.css' );
wp_enqueue_style( 'animate_css' , get_template_directory_uri() . '/assets/animate.css/animate.min.css' );
wp_enqueue_style( 'theme_css' , get_template_directory_uri() . '/assets/theme/css/style.css' );
wp_enqueue_style( 'mbr_additional_css' , get_template_directory_uri() . '/assets/mobirise/css/mbr-additional.css' );
}

add_action ('wp_enqueue_scripts','SECNIX_HTML_TO_WORDPRESS_STYLES');

function SECNIX_HTML_TO_WORDPRESS_JS () {
wp_enqueue_script( 'tether_js' , get_template_directory_uri() . '/assets/tether/tether.min.js', array ('jquery'), '', true );
wp_enqueue_script( 'bootstrap_js' , get_template_directory_uri() . '/assets/bootstrap/js/bootstrap.min.js', array ('jquery'), '', true );
wp_enqueue_script( 'scroll_js' , get_template_directory_uri() . '/assets/smooth-scroll/smooth-scroll.js', array ('jquery'), '', true );
wp_enqueue_script( 'dropdown_js' , get_template_directory_uri() . '/assets/dropdown/js/script.min.js', array ('jquery'), '', true );
wp_enqueue_script( 'touch-swipe_js' , get_template_directory_uri() . '/assets/touch-swipe/jquery.touch-swipe.min.js', array ('jquery'), '', true );
wp_enqueue_script( 'touch-swipe_js' , get_template_directory_uri() . '/assets/touch-swipe/jquery.touch-swipe.min.js', array ('jquery'), '', true );
wp_enqueue_script( 'viewport_js' , get_template_directory_uri() . '/assets/viewport-checker/jquery.viewportchecker.js', array ('jquery'), '', true );
wp_enqueue_script( 'jarallax_js' , get_template_directory_uri() . '/assets/jarallax/jarallax.js', array ('jquery'), '', true );
wp_enqueue_script( 'theme_js' , get_template_directory_uri() . '/assets/theme/js/script.js', array ('jquery'), '', true );
wp_enqueue_script( 'zepto_js' , get_template_directory_uri() . '/assets/js/zepto.min.js', array ('jquery'), '', true );
}

add_action ('wp_enqueue_scripts','SECNIX_HTML_TO_WORDPRESS_JS');

 ?>
