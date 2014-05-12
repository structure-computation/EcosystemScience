#clear page
MAIN_DIV = document.body

APPS = new Lst

clear_page = ->
    while MAIN_DIV.firstChild?
        MAIN_DIV.removeChild MAIN_DIV.firstChild

#inclusion dans une nouvelle session        
include_standard_session = (td) ->    
    td.applications.push new TreeAppApplication_CRM
    td.applications.push new TreeAppApplication_Annotation
    td.applications.push new TreeAppApplication_Test
    
    
    td.modules.push new TreeAppModule_UndoManager
    td.modules.push new TreeAppModule_PanelManager
    td.modules.push new TreeAppModule_File
    td.modules.push new TreeAppModule_Apps
    #td.modules.push new TreeAppModule_Projects
    td.modules.push new TreeAppModule_TreeView    
        
#inclusion dans une nouvelle session        
include_session = (td) ->    
    td.modules.push new TreeAppModule_UndoManager
    td.modules.push new TreeAppModule_PanelManager
    td.modules.push new TreeAppModule_File
    td.modules.push new TreeAppModule_Apps
    #td.modules.push new TreeAppModule_Projects
    
    
    td.modules.push new TreeAppModule_Animation
    td.modules.push new TreeAppModule_TreeView    
        
#type de nouvelle session
new_session = ->
    td = new TreeAppData
    td.new_session()
    include_session td
    td
 
new_standard_session = ->
    td = new TreeAppData
    td.new_standard_session()
    include_standard_session td
    td

try_username = () ->
    username = document.getElementById( 'username' ).value
    password = document.getElementById( 'password' ).value

    xhr_object = FileSystem._my_xml_http_request()
    xhr_object.open 'GET', "get_user_id?u=#{encodeURI username}&p=#{encodeURI password}", true
    xhr_object.onreadystatechange = ->
        if @readyState == 4 and @status == 200
            lst = @responseText.split " "
            user_id = parseInt lst[ 0 ]
            if user_id > 0
                launch_ecosystem_mecanic user_id, decodeURIComponent lst[ 1 ].trim()
            else
                document.getElementById( 'pwscomment' ).innerHTML = "Wrong username/password"
                
            
    xhr_object.send()
    
 
keypresslogin = ( e ) ->
    if e.which == 13
        try_username()
    else
        document.getElementById( 'pwscomment' ).innerHTML = ""

#main program
launch_ecosystem_mecanic = ( userid, home_dir, main = document.body ) ->
    FileSystem._home_dir = home_dir
    FileSystem._userid   = userid
    MAIN_DIV = main
    
    #ajout des applications de EcosystemMecanics
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
        
        
    bs = new BrowserState
    fs = new FileSystem
    
    bs.location.bind ->
        clear_page()

        # file -> make a new session
        if bs.location.protocol.get() == 'file:'
            td = new_session()
            app = new TreeApp main, td
            
        else
            hash = bs.location.hash.get()
            # something to reload ?
            if hash.length > 1
                path = decodeURIComponent hash.slice 1
                fs.load path, ( td, err ) ->
                    if err
                        window.location = "#"
                    else
                        app = new TreeApp main, td
                            
                        # visualisation
                        fs.load_or_make_dir "/sessions/" + fs._session_num, ( session_dir, err ) ->
                            session_dir.add_file "server_assisted_visualization", new ServerAssistedVisualization app, bs
                    
            # else, browse old session
            else
                fs.load_or_make_dir home_dir, ( session_dir, err ) ->
                    div = new_dom_element
                        parentNode: main

                    div_top = new_dom_element
                        parentNode: div
                        style:
                           width: "100%"
                           padding: "10px 20px 10px 20px"
                           height: "50px"
                           #background: "#e5e5e5"
                        
                        
                    # NEW SESSION
                    new_dom_element
                        nodeName: "button"
                        txt: "New scientific project"
                        parentNode: div_top
                        onclick: ( evt ) ->
                            clear_page() 
                            name = prompt "Project name", "project " + new Date()
                            # name = "session " + new Date()
                            td = new_session()
                            
                            session_dir.add_file name, td, model_type: "Session", icon: "session"
                            window.location = "#" + encodeURI( "#{home_dir}/#{name}" )
                    
                    #new_dom_element
                    #    nodeName: "button"
                    #    txt: "New standard project"
                    #    parentNode: div_top
                    #    onclick: ( evt ) ->
                    #        clear_page() 
                    #        name = prompt "Project name", "project " + new Date()
                    #        # name = "session " + new Date()
                    #        td = new_standard_session()
                    #        
                    #        session_dir.add_file name, td, model_type: "Session", icon: "session"
                    #        window.location = "#" + encodeURI( "#{home_dir}/#{name}" )
                    
                    item_cp = new ModelEditorItem_Directory
                        el             : div
                        model          : session_dir
                        use_icons      : false
                        use_upload     : false
                        use_breadcrumb : false
                        display        : "Session" 

                    

                    # RELOAD
                    ModelEditorItem_Directory.add_action "Session", ( file, path, browser ) ->
                        clear_page()
                        window.location = "#" + encodeURI( "#{home_dir}/#{file.name.get()}" )
