#clear page
APPS = new Lst
USER_EMAIL = ""

    
load_if_cookie_desk = () ->
    if $.cookie("email") and $.cookie("password")
        email = $.cookie("email")
        password = $.cookie("password")
        USER_EMAIL = email
        
        xhr_object = FileSystem._my_xml_http_request()
        xhr_object.open 'GET', "get_user_id?u=#{encodeURI email}&p=#{encodeURI password}", true
        xhr_object.onreadystatechange = ->
            if @readyState == 4 and @status == 200
                lst = @responseText.split " "
                user_id = parseInt lst[ 0 ]
                if user_id > 0
                    #launch_ecosystem_mecanic user_id, decodeURIComponent lst[ 1 ].trim()
                    launch_desk user_id, decodeURIComponent lst[ 1 ].trim()
                else
                    window.location = "login.html" 
                    
                
        xhr_object.send()
    
    else   
        window.location = "login.html" 
              
        
        
launch_desk = ( userid, home_dir, main = document.body ) ->
    MAIN_DIV = main
    APPS.push new TreeAppApplication_Correlation
    APPS.push new TreeAppApplication_Scills3D
    APPS.push new TreeAppApplication_Scult3D
    APPS.push new TreeAppApplication_Scills2D
    APPS.push new TreeAppApplication_Scult2D
    APPS.push new TreeAppApplication_FieldsComparator
    #APPS.push new TreeAppApplication_UnvReader3D
    #APPS.push new TreeAppApplication_UnvReader2D
    APPS.push new TreeAppApplication_Mesher
    APPS.push new TreeAppApplication_Sketcher
    APPS.push new TreeAppApplication_StepReader  
    APPS.push new TreeAppApplication_Plot3D
    APPS.push new TreeAppApplication_Plot2D
    #APPS.push new TreeAppApplication_DeepCopy
    APPS.push new TreeAppApplication_CsvReader
    APPS.push new TreeAppApplication_Annotation
    APPS.push new TreeAppApplication_Scilab
    APPS.push new TreeAppApplication_Acquisition
    APPS.push new TreeAppApplication_Grid
    APPS.push new TreeAppApplication_Test
    
    #login bar
    login_bar = new LoginBar main, USER_EMAIL
    
    #desk
    FileSystem._home_dir = home_dir
    FileSystem._userid   = userid
    bs = new BrowserState
    fs = new FileSystem
    config_dir = FileSystem._home_dir + "/__config__" 
    
    fs.load_or_make_dir config_dir, ( current_dir, err ) ->
        config_file = current_dir.detect ( x ) -> x.name.get() == ".config"
        if not config_file?
            config  = new DeskConfig
            current_dir.add_file ".config", config, model_type: "Config"
            create_desk_view config, main

        else
            config_file.load ( config, err ) =>
                create_desk_view config, main
  
    
create_desk_view = ( config, main = document.body ) ->
    dd = new DeskData  config  
    dd.new_session()
    app = new DeskApp main, dd  
    
    


