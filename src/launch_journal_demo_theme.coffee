
#clear page
MAIN_DIV = document.body
USER_EMAIL = ""
APPS = new Lst


#inclusion dans une nouvelle session        
include_session = (td) ->    
    td.modules.push new TreeAppModule_UndoManager
    td.modules.push new TreeAppModule_PanelManager
    td.modules.push new TreeAppModule_File
    td.modules.push new TreeAppModule_Apps false
    #td.modules.push new TreeAppModule_Projects   
    
    td.modules.push new TreeAppModule_Animation
    td.modules.push new TreeAppModule_TreeView    

#type de nouvelle session
new_session = ->
    td = new TreeAppData
    td.new_session()
    include_session td
    td



#main program
launch_journal_demo_theme = ( main = document.body ) ->
    FileSystem._home_dir = "/demo/"
    FileSystem._userid   = "168"
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
        
    
    #lab
    bs = new BrowserState
    fs = new FileSystem
    
    td = new_session()
    app = new TreeApp main, td, false
        
    # visualisation
    fs.load_or_make_dir "/sessions/" + fs._session_num, ( session_dir, err ) ->
        session_dir.add_file "server_assisted_visualization", new ServerAssistedVisualization app, bs
                