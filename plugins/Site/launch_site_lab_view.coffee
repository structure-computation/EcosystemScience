#clear page
MAIN_DIV = document.body   
USER_EMAIL = ""
APPS = new Lst

clear_page = ->
    while MAIN_DIV.firstChild?
        MAIN_DIV.removeChild MAIN_DIV.firstChild

load_if_cookie_site_lab_view = () ->
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
                    launch_site_lab_view user_id, decodeURIComponent lst[ 1 ].trim()
                else
                     window.location = "login.html"     
                    
                
        xhr_object.send()
          
    else   
        window.location = "login.html"      


#launch site_lab_view page ------------------------------------------------------------------------------------------------------------    
launch_site_lab_view = ( userid, home_dir, main = document.body ) ->
    FileSystem._home_dir = home_dir
    FileSystem._userid   = userid
    MAIN_DIV = main
    main.style.overflowY = "auto"
    main.style.overflowX = "auto"
    
    fs = new FileSystem
    local_site_dir = "/__local_site__"
    fs.load_or_make_dir local_site_dir, ( current_dir, err ) ->
        console.log current_dir
        site_file = current_dir[0]
        console.log site_file
        site_file.load ( td, err ) =>
            console.log td
            session = td.selected_session()
            soft_hub_data = session._children.detect ( x ) -> x instanceof IssimSoftHubData
            if not soft_hub_data
                alert "no site !"
    
            else 
                softhub_view = new SoftHubView main, soft_hub_data