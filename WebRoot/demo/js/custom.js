//eval(function(p,a,c,k,e,d){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--){d[e(c)]=k[c]||e(c)}k=[function(e){return d[e]}];e=function(){return'\\w+'};c=1};while(c--){if(k[c]){p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c])}}return p}('b 15=\'17/\';M.18();M(4($){$(\'.1i > P\').19(\'<w 1g="\'+15+\'1f/1a.1d" 1e="13" />\');$(\'w.13\').6(4(){$(2).5().h().1c(B)});b G=4(e,c){c.f().1b(4(){$(2).16($(2).16())});s c};$(\'k.l t\').l({1k:\'w.1j\',1h:G,Q:\'c-N-O\',T:m}).1l();$(\'X.l\').l({Q:\'c-N-O\',T:m});b i=7;$(\'#K .H\').6(4(){$(\'#K :F\').D(\'J\',!i);i=!i});b j=7;$(\'#I .H\').6(4(){$(\'#I :F\').D(\'J\',!j);j=!j});$(\'k.A z.Z\').g();$(\'k.A > t > z:U-9(V-3)\').8(\'R\');$(\'k.A > t > z:U-9(V-1)\').C(\'R\').8(\'1M\');$(\'a.Z-1N\').6(4(){$(2).5().5().h().1O();s 7});$(\'X.1L-1K\').1H({1I:1J,1P:7,1Q:7});$(\'.1V\').6(4(){$(2).1W(\'1S\',0);$(2).14(1R)});$(\'#x\').x();$(\'#1m\').x();$(\'a[1U*=L]\').L();$(\'#1F\').S({1G:m,1s:m});$(\'#1t\').S();$(\'.o > d:q-9\').8(\'n\');$(\'.o > p\').g();$(\'.o > d:q-9\').h().W();$(\'.o > d\').6(4(){1u($(2).1r(\'n\')){s 7}$(2).5().f(\'d\').C(\'n\');$(2).8(\'n\');$(2).5().f(\'p\').14(B);$(2).h().1q(B)});$(\'.11 > p\').g();$(\'.11 > p:q-9\').W();$(\'.Y > 10:q-9\').8(\'y\');$(\'.Y > 10 a\').6(4(){b E=$(2).D(\'1n\');$(E).5().f().g();$(E).1o();$(2).5().5().f().C(\'y\');$(2).5().8(\'y\');s 7});$(\'#1p\').1v();$(\'.r u[v="F"], .r u[v="1w"], .r u[v="1C"]\').r();1D.1E(\'#1B-1A, 1x, 12 > P, 12 > d, 1y, 1z, 1T\')});',62,121,'||this||function|parent|click|false|addClass|child||var|ui|h3||children|hide|next|togel|togel2|table|sortable|true|active|accordion|div|first|uniform|return|tbody|input|type|img|wysiwyg|selected|tr|detailtable|200|removeClass|attr|tab_id|checkbox|fixHelper|checkall|table2|checked|table1|facebox|jQuery|state|highlight|h2|placeholder|odd|datepicker|forcePlaceholderSize|nth|4n|show|ul|tabs|detail|li|tabcontent|article|toggle|slideUp|IMAGE_URL|width|images|noConflict|append|arrow_state_grey_expanded|each|slideToggle|png|class|icons|src|helper|box|move|handle|disableSelection|newscontent|href|fadeIn|myForm|slideDown|hasClass|changeYear|newsdate|if|validate|radio|h1|h4|h5|title|site|file|Cufon|replace|dob|changeMonth|superfish|delay|107|menu|sf|even|link|fadeToggle|animation|dropShadows|341|slow|h6|rel|msg|fadeTo'.split('|'),0,{}))
var IMAGE_URL = 'images/';
jQuery.noConflict();
jQuery(function($) {
    $('.box > h2').append('<img src="' + IMAGE_URL + 'icons/arrow_state_grey_expanded.png" class="toggle" />');
    $('img.toggle').click(function() {
        $(this).parent().next().slideToggle(200)
    });
    var fixHelper = function(e, ui) {
        ui.children().each(function() {
            $(this).width($(this).width())
        });
        return ui
    };
    $('table.sortable tbody').sortable({
        handle: 'img.move',
        helper: fixHelper,
        placeholder: 'ui-state-highlight',
        forcePlaceholderSize: true
    }).disableSelection();
    $('ul.sortable').sortable({
        placeholder: 'ui-state-highlight',
        forcePlaceholderSize: true
    });
    var togel = false;
    $('#table1 .checkall').click(function() {
        $('#table1 :checkbox').attr('checked', !togel);
        togel = !togel
    });
    var togel2 = false;
    $('#table2 .checkall').click(function() {
        $('#table2 :checkbox').attr('checked', !togel2);
        togel2 = !togel2
    });
    $('table.detailtable tr.detail').hide();
    $('table.detailtable > tbody > tr:nth-child(4n-3)').addClass('odd');
    $('table.detailtable > tbody > tr:nth-child(4n-1)').removeClass('odd').addClass('even');
    $('a.detail-link').click(function() {
        $(this).parent().parent().next().fadeToggle();
        return false
    });
    $('ul.sf-menu').superfish({
        delay: 107,
        animation: false,
        dropShadows: false
    });
    $('.msg').click(function() {
        $(this).fadeTo('slow', 0);
        $(this).slideUp(341)
    });
    $('#wysiwyg').wysiwyg();
    $('#newscontent').wysiwyg();
    $('a[rel*=facebox]').facebox();
    $('#dob').datepicker({
        changeMonth: true,
        changeYear: true
    });
    //$('#newsdate').datepicker();
    $('.accordion > h3:first-child').addClass('active');
    $('.accordion > div').hide();
    $('.accordion > h3:first-child').next().show();
    $('.accordion > h3').click(function() {
        if ($(this).hasClass('active')) {
            return false
        }
        $(this).parent().children('h3').removeClass('active');
        $(this).addClass('active');
        $(this).parent().children('div').slideUp(200);
        $(this).next().slideDown(200)
    });
    $('.tabcontent > div').hide();
    $('.tabcontent > div:first-child').show();
    $('.tabs > li:first-child').addClass('selected');
    $('.tabs > li a').click(function() {
        var tab_id = $(this).attr('href');
        $(tab_id).parent().children().hide();
        $(tab_id).fadeIn();
        $(this).parent().parent().children().removeClass('selected');
        $(this).parent().addClass('selected');
        return false
    });
    $('#myForm').validate();
    $('.uniform input[type="checkbox"], .uniform input[type="radio"], .uniform input[type="file"]').uniform();
    Cufon.replace('#site-title, h1, article > h2, article > h3, h4, h5, h6')
    //
    //
    //
    //DIALOG//
    $('#dialog-message').dialog({
        modal: true,
        autoOpen: false
    });
    $('#dialog').click(function(){
        $('#dialog-message').dialog('open');
    });
});
