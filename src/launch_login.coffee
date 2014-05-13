load_if_cookie_login = () ->
    if $.cookie("username") and $.cookie("password")
        username = $.cookie("username")
        password = $.cookie("password")
        
        xhr_object = FileSystem._my_xml_http_request()
        xhr_object.open 'GET', "get_user_id?u=#{encodeURI username}&p=#{encodeURI password}", true
        xhr_object.onreadystatechange = ->
            if @readyState == 4 and @status == 200
                lst = @responseText.split " "
                user_id = parseInt lst[ 0 ]
                if user_id > 0
                    window.location = "desk.html" 
                else
                    document.getElementById( 'pwscomment' ).innerHTML = "Wrong username/password"
                    
                
        xhr_object.send()
    
    
try_username = () ->
    username = document.getElementById( 'username' ).value
    password = document.getElementById( 'password' ).value

    $.cookie( "username", username, {expires:7} )
    $.cookie( "password", password, {expires:7} )
    
    xhr_object = FileSystem._my_xml_http_request()
    xhr_object.open 'GET', "get_user_id?u=#{encodeURI username}&p=#{encodeURI password}", true
    xhr_object.onreadystatechange = ->
        if @readyState == 4 and @status == 200
            lst = @responseText.split " "
            user_id = parseInt lst[ 0 ]
            if user_id > 0
                window.location = "desk.html"
                #launch_ecosystem_mecanic user_id, decodeURIComponent lst[ 1 ].trim()
                #desk_page user_id, decodeURIComponent lst[ 1 ].trim()
            else
                document.getElementById( 'pwscomment' ).innerHTML = "Wrong username/password"
                
            
    xhr_object.send()
    
 
keypresslogin = ( e ) ->
    if e.which == 13
        try_username()
    else
        document.getElementById( 'pwscomment' ).innerHTML = ""
        
        

