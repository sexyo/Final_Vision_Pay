/*
*
* Nom du pluging : cryxpad
* Auteur: Atsé Y. ange michael
* Version 1.0
* Requirement : jQuery v1.11.3,Bootstrap v4 (http://getbootstrap.com)
*/

(function($)
{
	$.fn.cryxpad=function(options)
	{
    	//On définit nos paramètres par défaut
    	var defauts =
        {
            'parentId':'cryxpad-clavier',
            'containerClass':'cryxpad-container',
            'inputFormId':'cryxpad-input-field',
            'removeButtonId':'cryxpad-remove-btn',
            'validateButtonId':'cryxpad-validate-btn',
            'containerpadding':4,
            'carreaux':4,
    		'width': 100,		
    		'height': 80,
    		'background-color': '#e0f2f1;',
            'button':{
                'class':"btn btn-primary",
                'marginLeft':1,
                'marginTop':1,
                'marginBottom':1,
            },
            'callback': null
		      //Fonction appelée à chaque nouvelle image
        };
        //var positionGenerees =[];

        //On fusionne nos deux objets ! =D
        var parametres=$.extend(defauts, options);
        var $inputcodeElement = $('input#'+parametres.inputFormId+'');
        $inputcodeElement.prop('readonly', true);

        var $removeBtnElement = $('input#'+parametres.removeButtonId+'');


        var selectednumber=null;

        var fieldArray = [];
        return this.each(function(){

           var element=$(this);
           var container = $('.'+parametres.containerClass+'');
            element.css(
            {
                'position': 'relative',
                'margin-left': 'auto',
                'margin-right': 'auto',
                'width': (parametres.width *parametres.carreaux)+(parametres.carreaux *parametres.button.marginLeft)+3,
                'height': 108,
                'background-color': '#e0f2f1',
                'border-color':'#e0f2f1',
                'left': '-50%'
            });

            for (i = 0; i < parametres.carreaux; i++) {
                var a = new Array(parametres.carreaux);
                a[i] = new Array(parametres.carreaux);
                for (j = 0; j < parametres.carreaux-1; j++) {
                    a[i][j] = "[" + i + "," + j + "]";
                    var tt = $("<button type='button' class='code-btn'></button>").css({
                        'position': 'absolute',
                        'width': parametres.width,
                        'height': parametres.height,
                        'text-align': "center",
                        'top': j*parametres.height,
                        'left': (i*parametres.width)-3,
                        'margin-left':(i*parametres.button.marginLeft)+3,
                        'margin-top':(j*parametres.button.marginTop)+3
                    }).addClass(''+parametres.button.class+'');
                    tt.attr({
                        'id':j+"_"+i+"_div"
                    });
                    tt.appendTo(element);
                }
            }

            for (var i=0; i<10; i++) { 
                var rep =false
                var tt = fieldArray.length;
                if(tt ==0){
                    var x = getRandomInt(0,parametres.carreaux-1); 
                    var y = getRandomInt(0,parametres.carreaux-2); 
                    var data={
                       x : x,
                       y: y
                   }
                   fieldArray[i]=data;
               }
               else if(fieldArray.length>0){
                    var data={};
                    data.x = getRandomInt(0,parametres.carreaux-1); 
                    data.y = getRandomInt(0,parametres.carreaux-2); 

                    rep = ifExist(fieldArray,data);
                    while(!rep){
                        data.x = getRandomInt(0,parametres.carreaux-1); 
                        data.y = getRandomInt(0,parametres.carreaux-2); 
                        rep = ifExist(fieldArray,data);
                    }
                    fieldArray[i]=data;
                }
            }
            var i=0;
            fieldArray.forEach(function(p){
                var elId = p.y+"_"+p.x+"_div";
                var el = $('button[id="'+elId+'"]');
                el.attr("data-number",i);
                //el.html('<span style="color:with;">'+i+'</span>');
                el.html(i);
                i++;
            });

            $(document).on("click",'.'+parametres.containerClass+' .code-btn',function(e) {
                debugger;
                e.preventDefault();
                e.stopPropagation();
                buttonClik($(this));
            });
            /*
            * remove bnt click
            */
            $(document).on("click",'#'+parametres.removeButtonId+'',function(e) {
                debugger;
                e.preventDefault();
                e.stopPropagation();
                removeButtonClick($(this))
            });

            $(document).on("click",'#'+parametres.validateButtonId+'',function(e) {
                debugger;
                e.preventDefault();
                e.stopPropagation();
                validaterButtonClick($(this))
            });  
        });

        function buttonClik($el){
            debugger;
            if($el.data("number") !== undefined){
                debugger;
                var data = $el.data("number");
                selectednumber = $inputcodeElement.val().toString()+data.toString();
                if(data!= null || data!=""){
                    $inputcodeElement.val(selectednumber);
                }
            }
        };

        function removeButtonClick($el){
            var inputCode = $inputcodeElement.val(
                function(index, value){
                    return value.substr(0, value.length - 1);
            });
        };

        function validaterButtonClick($el){
            alert($inputcodeElement.val());
        };

    };
    /*
    * usefull functions
    **
    */
    function getRandomArbitrary(min, max) {
        return Math.random() * (max - min) + min;
    }

    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    function ifExist(dd,data){

    	for (var i = 0; i < dd.length; i++)
        {
            if(dd[i].x ==data.x && dd[i].y ==data.y){
                console.log("p.x="+dd[i].x+" / data.x="+data.x);
                console.log("p.y="+dd[i].y+" / data.y="+data.y);
                return false;
            }
        }
        return true;
    }

})(jQuery);

