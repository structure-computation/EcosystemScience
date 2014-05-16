


#launch login page ------------------------------------------------------------------------------------------------------------    
launch_login = ( userid, home_dir, main = document.body ) ->
    MAIN_DIV = main
    main.style.overflowY = "auto"
    main.style.overflowX = "auto"
    
    login_view = new LoginView main

load_if_cookie_login = () ->
    if $.cookie("email") and $.cookie("password")
        email = $.cookie("email")
        password = $.cookie("password")
        
        xhr_object = FileSystem._my_xml_http_request()
        xhr_object.open 'GET', "get_user_id?u=#{encodeURI email}&p=#{encodeURI password}", true
        xhr_object.onreadystatechange = ->
            if @readyState == 4 and @status == 200
                lst = @responseText.split " "
                user_id = parseInt lst[ 0 ]
                if user_id > 0
                    window.location = "desk.html" 
                else
                    document.getElementById( 'pwscomment' ).innerHTML = "Wrong email/password"
                    
                
        xhr_object.send()
    else
        launch_login()
    