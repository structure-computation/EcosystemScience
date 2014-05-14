

create_login_div = ( container_bakground ) ->
    while container_bakground.firstChild?
        container_bakground.removeChild container_bakground.firstChild
    
    container_title = new_dom_element
        parentNode : container_bakground
        nodeName   : "div" 
        txt        : "Connect to access your Desk and Lab"
        style      :
            height     : 30
            width      : "100%"
            fontWeight : "bold"
            fontSize   : "20px"
            textAlign   : "center"
            #border     : "1px solid grey"
            margin     : "20px 0 0 0px"
            float      : "left"
    
    container_login = new_dom_element
        parentNode : container_bakground
        nodeName   : "div" 
        style      :
            height     : 470
            width      : 400
            #border     : "1px solid grey"
            margin     : "0px 0 0 100px"
            float      : "left"
#             fontWeight : "bold"
#             fontSize   : "20px"
    
    container_div = new_dom_element
        parentNode : container_login
        nodeName   : "div" 
        style      :
            height     : 250
            width      : 400
            margin     : "210px 0 0 0px"
            border     : "1px solid grey"
            float      : "left"
#             fontWeight : "bold"
#             fontSize   : "20px"
    
    name_email = new_dom_element
        parentNode : container_div
        nodeName   : "div" 
        txt        : "email"
        style      :
            width      : "100%"
            height     : 25
#             fontWeight : "bold"
            fontSize   : "20px"
            textAlign   : "center"
            margin     : "10px 0 0 0px"
            float      : "left"
    
    input_email = new_dom_element
        parentNode : container_div
        nodeName   : "input"
        type       : "text"
        id         : "email"
        name       : "email"
        float      : "left"
#         value      : "email" 
        style      :
            width      : 300
            height     : 25
            fontSize   : "15px"
            margin     : "10px 0 0 50px"
            textAlign   : "center"
            float      : "left"
#         onblur  : ( evt ) => 
#             this.value = 'email' if this.value == ''
#         onfocus  : ( evt ) =>
#             value = "" if value == 'email'
        onkeypress : ( evt ) =>
            keypresslogin( event )
     
    name_password = new_dom_element
        parentNode : container_div
        nodeName   : "div" 
        txt        : "password"
        style      :
            width      : "100%"
            height     : 25
#             fontWeight : "bold"
            fontSize   : "20px"
            textAlign   : "center"
            margin     : "10px 0 0 0px"
            float      : "left"
            
    input_password = new_dom_element
        parentNode : container_div
        nodeName   : "input"
        id         : "password"
        type       : "password"
        name       : "password"
        float      : "left"
        style      :
            width      : 300
            height     : 25
            fontSize   : "15px"
            margin     : "10px 0 0 50px"
            textAlign   : "center"
            float      : "left"
        onkeypress : ( evt ) =>
            keypresslogin( event )
            
    login_button = new_dom_element
        parentNode : container_div
        nodeName   : "button"
        float      : "left"
        txt     : "Log in"
        style      :
            width      : 300
            height     : 30
            border     : "none"
            fontSize   : "20px"
            margin     : "10px 0 0 50px"
            textAlign  : "center"
            background : "#4dbce9"
            float      : "left"
        onmousedown: ( evt ) =>
            #alert "login_button"
            try_username()

    container_comment = new_dom_element
        parentNode : container_div
        nodeName   : "div" 
        id         : 'pwscomment'
        style      :
            width      : 300
            height     : 30
            border     : "none"
            fontSize   : "20px"
            margin     : "10px 0 0 50px"
            textAlign  : "center"
            float      : "left"
            color : "red"
                
    link_new_user = new_dom_element
        parentNode : container_div
        nodeName   : "div" 
        txt     : "New account"
        style      :
            height     : 20
            width      : 100
            margin     : "10px 0 0 60px"
            float      : "left"
            fontSize   : "15px"
            color      : "#4dbce9"
            cursor     : "pointer"
#             border     : "1px solid grey"
        onmousedown: ( evt ) =>
            create_new_account_div(container_bakground)
            
    link_forgot_password = new_dom_element
        parentNode : container_div
        nodeName   : "div" 
        txt     : "Forgot your password ?"
        style      :
            height     : 20
            width      : 180
            margin     : "10px 0 0 30px"
            float      : "left"
            fontSize   : "15px"
            color      : "#4dbce9"
            cursor     : "pointer"
#             border     : "1px solid grey"
        onmousedown: ( evt ) =>
            create_lost_password_div(container_bakground)
            

            
# create a new account ---------------------------------------------------------------------------------------------   
create_new_account_div = ( container_bakground ) ->
    while container_bakground.firstChild?
        container_bakground.removeChild container_bakground.firstChild
    
    
    container_title = new_dom_element
        parentNode : container_bakground
        nodeName   : "div" 
        txt        : "Create your account to access your online lab"
        style      :
            height     : 30
            width      : "100%"
            fontWeight : "bold"
            fontSize   : "20px"
            textAlign   : "center"
            #border     : "1px solid grey"
            margin     : "20px 0 0 0px"
            float      : "left"
    
    container_login = new_dom_element
        parentNode : container_bakground
        nodeName   : "div" 
        style      :
            height     : 470
            width      : 400
            #border     : "1px solid grey"
            margin     : "0px 0 0 100px"
            float      : "left"
            background : "#262626"
#             fontWeight : "bold"
#             fontSize   : "20px"
    
    container_div = new_dom_element
        parentNode : container_login
        nodeName   : "div" 
        style      :
            height     : 320
            width      : 400
            margin     : "140px 0 0 0px"
            border     : "1px solid grey"
            float      : "left"
#             fontWeight : "bold"
#             fontSize   : "20px"
    #email
    name_new_email = new_dom_element
        parentNode : container_div
        nodeName   : "div" 
        txt        : "email"
        style      :
            width      : "100%"
            height     : 25
#             fontWeight : "bold"
            fontSize   : "20px"
            textAlign   : "center"
            margin     : "10px 0 0 0px"
    
    input_new_email = new_dom_element
        parentNode : container_div
        nodeName   : "input"
        type       : "text"
        id         : "new_email"
        name       : "new_email"
#         value      : "Email" 
        style      :
            width      : 300
            height     : 25
            fontSize   : "15px"
            margin     : "10px 0 0 50px"
            textAlign   : "center"
        onkeypress : ( evt ) =>
            keypress_new_account( event )
            
    #password 
    name_new_password = new_dom_element
        parentNode : container_div
        nodeName   : "div" 
        txt        : "new password"
        style      :
            width      : "100%"
            height     : 25
#             fontWeight : "bold"
            fontSize   : "20px"
            textAlign   : "center"
            margin     : "10px 0 0 0px"
            
    input_new_password = new_dom_element
        parentNode : container_div
        nodeName   : "input"
        type       : "password"
        id         : "new_password"
        name       : "new_password"
        style      :
            width      : 300
            height     : 25
            fontSize   : "15px"
            margin     : "10px 0 0 50px"
            textAlign   : "center"
        onkeypress : ( evt ) =>
            keypress_new_account( event )
            
    #confirmed password 
    name_confirmed_password = new_dom_element
        parentNode : container_div
        nodeName   : "div" 
        txt        : "confirmed password"
        style      :
            width      : "100%"
            height     : 25
#             fontWeight : "bold"
            fontSize   : "20px"
            textAlign   : "center"
            margin     : "10px 0 0 0px"
            
    input_confirmed_password = new_dom_element
        parentNode : container_div
        nodeName   : "input"
        type       : "password"
        id         : "confirmed_password"
        name       : "confirmed_password"
        style      :
            width      : 300
            height     : 25
            fontSize   : "15px"
            margin     : "10px 0 0 50px"
            textAlign   : "center"
        onkeypress : ( evt ) =>
            keypress_new_account( event )
     
    #create new account
    new_account_button = new_dom_element
        parentNode : container_div
        nodeName   : "button"
        float      : "left"
        txt     : "Create account"
        style      :
            width      : 300
            height     : 30
            border     : "none"
            fontSize   : "20px"
            margin     : "10px 0 0 50px"
            textAlign  : "center"
            background : "#4dbce9"
        onmousedown: ( evt ) =>
            #alert "new_account_button"
            try_new_account()

    container_comment = new_dom_element
        parentNode : container_div
        nodeName   : "div" 
        id         : 'pwscomment'
        style      :
            width      : 300
            height     : 30
            border     : "none"
            fontSize   : "20px"
            margin     : "10px 0 0 50px"
            textAlign  : "center"
            color : "red"
                
    link_login = new_dom_element
        parentNode : container_div
        nodeName   : "div" 
        txt     : "Log in"
        style      :
            height     : 20
            width      : 100
            margin     : "10px 0 0 60px"
            float      : "left"
            fontSize   : "15px"
            color      : "#4dbce9"
            cursor     : "pointer"
        onmousedown: ( evt ) =>
            create_login_div(container_bakground)
            
    link_forgot_password = new_dom_element
        parentNode : container_div
        nodeName   : "div" 
        txt     : "Forgot your password ?"
        style      :
            height     : 20
            width      : 200
            margin     : "10px 0 0 30px"
            float      : "left"
            fontSize   : "15px"
            color      : "#4dbce9"
            cursor     : "pointer"
        onmousedown: ( evt ) =>
            create_lost_password_div(container_bakground)
    

    
# lost password ---------------------------------------------------------------------------------------------    
create_lost_password_div = ( container_bakground ) ->
    while container_bakground.firstChild?
        container_bakground.removeChild container_bakground.firstChild
    
    container_title = new_dom_element
        parentNode : container_bakground
        nodeName   : "div" 
        txt        : "Ask for a new password"
        style      :
            height     : 30
            width      : "100%"
            fontWeight : "bold"
            fontSize   : "20px"
            textAlign   : "center"
            #border     : "1px solid grey"
            margin     : "20px 0 0 0px"
            float      : "left"
    
    
    container_login = new_dom_element
        parentNode : container_bakground
        nodeName   : "div" 
        style      :
            height     : 470
            width      : 400
            #border     : "1px solid grey"
            margin     : "0px 0 0 100px"
            float      : "left"
    
    container_div = new_dom_element
        parentNode : container_login
        nodeName   : "div" 
        style      :
            height     : 180
            width      : 400
            margin     : "280px 0 0 0px"
            border     : "1px solid grey"
            float      : "left"
#             fontWeight : "bold"
#             fontSize   : "20px"

    #email
    name_email = new_dom_element
        parentNode : container_div
        nodeName   : "div" 
        txt        : "email"
        style      :
            width      : "100%"
            height     : 25
#             fontWeight : "bold"
            fontSize   : "20px"
            textAlign   : "center"
            margin     : "10px 0 0 0px"
    
    input_email = new_dom_element
        parentNode : container_div
        nodeName   : "input"
        type       : "text"
        id         : "email"
        name       : "email"
#         value      : "Email" 
        style      :
            width      : 300
            height     : 25
            fontSize   : "15px"
            margin     : "10px 0 0 50px"
            textAlign   : "center"
        onkeypress : ( evt ) =>
            keypress_new_account( event )
            
     
    #get new password
    new_password_button = new_dom_element
        parentNode : container_div
        nodeName   : "button"
        float      : "left"
        txt     : "Get your new password"
        style      :
            width      : 300
            height     : 30
            border     : "none"
            fontSize   : "20px"
            margin     : "10px 0 0 50px"
            textAlign  : "center"
            background : "#4dbce9"
        onmousedown: ( evt ) =>
            #alert "new_password_button"
            get_new_password()

    container_comment = new_dom_element
        parentNode : container_div
        nodeName   : "div" 
        id         : 'pwscomment'
        style      :
            width      : 300
            height     : 30
            border     : "none"
            fontSize   : "20px"
            margin     : "10px 0 0 50px"
            textAlign  : "center"
            color : "red"
                
    link_login = new_dom_element
        parentNode : container_div
        nodeName   : "div" 
        txt     : "Log in"
        style      :
            height     : 20
            width      : 100
            margin     : "10px 0 0 60px"
            float      : "left"
            fontSize   : "15px"
            color      : "#4dbce9"
            cursor     : "pointer"
        onmousedown: ( evt ) =>
            create_login_div(container_bakground)
            
    link_new_user = new_dom_element
        parentNode : container_div
        nodeName   : "div" 
        txt     : "New account"
        style      :
            height     : 20
            width      : 100
            margin     : "10px 0 0 60px"
            float      : "left"
            fontSize   : "15px"
            color      : "#4dbce9"
            cursor     : "pointer"
        onmousedown: ( evt ) =>
            create_new_account_div(container_bakground)
    

#launch login page ------------------------------------------------------------------------------------------------------------    
launch_login = ( userid, home_dir, main = document.body ) ->
    MAIN_DIV = main
    main.style.overflowY = "auto"
    main.style.overflowX = "auto"
    
    icon_container = new_dom_element
        nodeName  : "div"
        parentNode: main
          
    container_bakground = new_dom_element
        parentNode : icon_container
        nodeName   : "div" 
        className  : "LoginBackground"
    
    create_login_div(container_bakground)
    
    
    
   

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
    
    
#log in function ----------------------------------------------------------------------------------
try_username = () ->
    email = document.getElementById( 'email' ).value
    password = document.getElementById( 'password' ).value

    $.cookie( "email", email, {expires:7} )
    $.cookie( "password", password, {expires:7} )
    
    xhr_object = FileSystem._my_xml_http_request()
    xhr_object.open 'GET', "get_user_id?u=#{encodeURI email}&p=#{encodeURI password}", true
    xhr_object.onreadystatechange = ->
        if @readyState == 4 and @status == 200
            lst = @responseText.split " "
            user_id = parseInt lst[ 0 ]
            if user_id > 0
                window.location = "desk.html"
            else
                document.getElementById( 'pwscomment' ).innerHTML = "Wrong email/password" if document.getElementById( 'pwscomment' )
                
            
    xhr_object.send()
    
 
keypresslogin = ( e ) ->
    if e.which == 13
        try_username()
    else
        document.getElementById( 'pwscomment' ).innerHTML = "" if document.getElementById( 'pwscomment' )
        
        
        
#Create a new account ----------------------------------------------------------------------------------    
try_new_account = () ->
    new_email = document.getElementById( 'new_email' ).value
    new_password = document.getElementById( 'new_password' ).value
    confirmed_password = document.getElementById( 'confirmed_password' ).value
    
    if new_password == confirmed_password
        xhr_object = FileSystem._my_xml_http_request()
        xhr_object.open 'GET', "get_new_account?e=#{encodeURI new_email}&p=#{encodeURI new_password}&cp=#{encodeURI confirmed_password}", true
        xhr_object.onreadystatechange = ->
            if @readyState == 4 and @status == 200
                lst = @responseText.split " "
                user_id = parseInt lst[ 0 ]
                if user_id > 0
                    window.location = "desk.html"
                    #launch_ecosystem_mecanic user_id, decodeURIComponent lst[ 1 ].trim()
                    #desk_page user_id, decodeURIComponent lst[ 1 ].trim()
                else
                    document.getElementById( 'pwscomment' ).innerHTML = "Wrong email/password" if document.getElementById( 'pwscomment' )             
        xhr_object.send()
    else
        document.getElementById( 'pwscomment' ).innerHTML = "confirmed password do not match !" if document.getElementById( 'pwscomment' )     
    
 
keypress_new_account = ( e ) ->
    if e.which == 13
        try_new_account()
    else
        document.getElementById( 'pwscomment' ).innerHTML = "" if document.getElementById( 'pwscomment' )
        
        
        
#get a new password ----------------------------------------------------------------------------------    
try_new_password = () ->
    email = document.getElementById( 'email' ).value
    
    xhr_object = FileSystem._my_xml_http_request()
    xhr_object.open 'GET', "get_new_password?e=#{encodeURI email}", true
    xhr_object.onreadystatechange = ->
        if @readyState == 4 and @status == 200
            lst = @responseText.split " "
            user_id = parseInt lst[ 0 ]
            if user_id > 0
                document.getElementById( 'pwscomment' ).innerHTML = "We have sent you a mail with your new password" if document.getElementById( 'pwscomment' )
            else
                document.getElementById( 'pwscomment' ).innerHTML = "Wrong email" if document.getElementById( 'pwscomment' )             
    xhr_object.send()
    
 
keypress_new_password = ( e ) ->
    if e.which == 13
        try_new_password()
    else
        document.getElementById( 'pwscomment' ).innerHTML = "" if document.getElementById( 'pwscomment' )