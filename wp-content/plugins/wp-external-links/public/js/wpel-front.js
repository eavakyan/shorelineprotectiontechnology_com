/**
 * WP Links Plugin
 * Admin
 */
/*global jQuery, window*/
jQuery(function ($) {
    const urlParams = new URLSearchParams(window.location.search);
    let link_to_find = decodeURI(urlParams.get('wpel-link-highlight'));
    
    if(link_to_find.length > 10){
        if($('a[href="' + link_to_find + '"]').length == 0){
            if(link_to_find.substr(-1) == '/'){
                link_to_find = link_to_find.slice(0, - 1);
            } else {
                link_to_find = link_to_find + '/';
            }
        }

        if($('a[href="' + link_to_find + '"]').length == 0){
            link_to_find = link_to_find.replace(window.location.origin,'');
        }
        
        if($('a[href="' + link_to_find + '"]').length == 0){
            if(link_to_find.substr(-1) == '/'){
                link_to_find = link_to_find.slice(0, - 1);
            } else {
                link_to_find = link_to_find + '/';
            }
        }

        if($('a[href="' + link_to_find + '"]').length == 0){
            alert('Link not found ' + link_to_find);
        } else {
            $('a[href="' + link_to_find + '"]').css('border', '3px dashed #00a1ff').css('box-shadow','1px 1px 18px 4px #00a1ff').css('padding', '10px');
            $([document.documentElement, document.body]).animate({
                scrollTop: $('a[href="' + link_to_find + '"]').offset().top - 100
            }, 100);
        }
    }

    $('.wpel-exit-confirmation').on('click', function(e){
        e.preventDefault();

        exit_confirmation_html = '';
        if(wp_external_links.overlay == '1'){
            exit_confirmation_html += '<div id="wpel_exit_confirmation_overlay"></div>';
        }
        exit_confirmation_html += '<div id="wpel_exit_confirmation">';
        if(wp_external_links.title.length>0){
            exit_confirmation_html += '<div id="wpel_exit_confirmation_title">'+wp_external_links.title+'</div>';
        }
        exit_confirmation_html += '<div id="wpel_exit_confirmation_link">'+wp_external_links.text+'<br /><a target="'+$(this).attr('target')+'" href="'+$(this).attr('href')+'">'+$(this).attr('href')+'</a></div>';
        exit_confirmation_html += '<div id="wpel_exit_confirmation_button_wrapper">';
        exit_confirmation_html += '<div id="wpel_exit_confirmation_cancel" onMouseOver="this.style.opacity=\'0.8\'" onMouseOut="this.style.opacity=\'1\'">' + wp_external_links.button_text + '</a></div>';
        exit_confirmation_html += '</div>';
        exit_confirmation_html += '</div>';

        exit_confirmation_html += '<style>';
        exit_confirmation_html += '#wpel_exit_confirmation_overlay{width:100%;height:100%;position:fixed;top:0px;left:0px;opacity:0.2;z-index:100000;background:'+wp_external_links.overlay_color+';}';
        exit_confirmation_html += '#wpel_exit_confirmation{z-index:100001;border-radius:4px;padding-bottom:40px;position:fixed;top:0px;left:0px;top:50%;left:50%;margin-top:-'+(wp_external_links.popup_height/2)+'px;margin-left:-'+(wp_external_links.popup_width/2)+'px;width:'+wp_external_links.popup_width+'px;height:'+wp_external_links.popup_height+'px;background:'+wp_external_links.background+';}';
        exit_confirmation_html += '#wpel_exit_confirmation_title{width:100%;padding:4px 10px; text-align:center; box-sizing: border-box; background:'+wp_external_links.title_background+';font-size:'+wp_external_links.title_size+'px; color:'+wp_external_links.title_color+';}';
        exit_confirmation_html += '#wpel_exit_confirmation_link{width:100%;padding:10px 20px; box-sizing: border-box;font-size:'+wp_external_links.text_size+'px; color:'+wp_external_links.text_color+';}';
        exit_confirmation_html += '#wpel_exit_confirmation_button_wrapper{width:100%; text-align:center; position:absolute; bottom:10px;}';
        exit_confirmation_html += '#wpel_exit_confirmation_cancel{cursor:pointer;border-radius:4px;padding:4px 10px;display:inline-block;font-size:'+wp_external_links.button_size+'px;color:'+wp_external_links.button_color+'; background:'+wp_external_links.button_background+';}';

        exit_confirmation_html += '@media only screen and (max-width: 900px) {';
        exit_confirmation_html += '#wpel_exit_confirmation{ width: 90%; margin: 0 auto; padding-bottom: 40px; top: 20%; position: fixed; left: auto; height: auto; height:'+wp_external_links.popup_height+'px; display: block; margin-left: 5%;}';
        exit_confirmation_html += '}';
        exit_confirmation_html += '</style>';
        
        $('body').append(exit_confirmation_html);
    });

    $('body').on('click', '#wpel_exit_confirmation_cancel', function(e){
        $('#wpel_exit_confirmation_overlay').remove();
        $('#wpel_exit_confirmation').remove();
    });
});
