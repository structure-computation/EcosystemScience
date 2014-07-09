# Copyright 2012 Structure Computation  www.structure-computation.com
# Copyright 2014 jeremie Bellec
#
# This file is part of Soda.
#
# Soda is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Soda is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with Soda. If not, see <http://www.gnu.org/licenses/>.



#
class IndexView extends View
    constructor: ( @el ) ->
        @page_container = new_dom_element
            nodeName  : "div"
            parentNode: @el
              
        @container_bakground = new_dom_element
            parentNode : @page_container
            nodeName   : "div" 
            className  : "indexBackground"
            
        
        @create_index()
        
#         @container_video = new_dom_element
#             parentNode : @page_container
#             nodeName   : "div" 
#             className  : "LoginBackground"
#             txt        : '<iframe width="560" height="315" src="//www.youtube.com/embed/K1MVV_nG8BI?rel=0" frameborder="0" allowfullscreen></iframe>'
        
        
    
    clear_page: ->
        while @container_bakground.firstChild?
            @container_bakground.removeChild @container_bakground.firstChild
    
    add_part_separator: ->
        part = new_dom_element
            parentNode : @container_bakground
            nodeName   : "div" 
            className  : "indexpart"
            style :
                height : 200
                background : "#e6e6e6"
    
    add_part: ( name, background = "", color = "", fixed = "" ) ->
        part = new_dom_element
            parentNode : @container_bakground
            nodeName   : "div" 
            className  : "indexpart"
            
        if background != ""
            part.style.background = background
            part.style.color = color
        
        if fixed != ""
            part.style.position = "fixed"
            part.style.top      = 0
            part.style.width    = "100%"
                
        center_part = new_dom_element
            parentNode : part
            nodeName   : "div" 
            id         : name
            className  : "indexcenterpart"
            
        return center_part
            
    add_col : ( subdivision, parent ) ->  
        nb_sub = Math.floor(100/subdivision)
        col = new_dom_element
            parentNode : parent
            nodeName   : "div" 
            style :
                width   : nb_sub + "%"
                float   : "left"
                textAlign : "center"
                margin: "0 0 20px 0"
                
        return col
    
    
    create_menu: ->
        menu = @add_part "menu", "#262626", "#f6f6f6", "fixed"
        
        menu_logo = new_dom_element
            parentNode : menu
            nodeName   : "div" 
            className  : "indexlogo"
            
        menu_presentation = new_dom_element
            parentNode : menu
            nodeName   : "div" 
            className  : "indexMenuButton"
            txt        : "Presentation"
            onclick: ( evt ) ->
                $(document.body).animate
                    scrollTop:   $('#presentation').offset().top - 80
                    1500
#             onclick: ( evt ) ->
#                 $('#presentation').animate
#                     width: '+20px'
#                     opacity: '0.5'
#                     2000
                             
        menu_team = new_dom_element
            parentNode : menu
            nodeName   : "div" 
            className  : "indexMenuButton"
            txt        : "Company"
            onclick: ( evt ) ->
                $(document.body).animate
                    scrollTop:   $('#team').offset().top - 80
                    1500

        menu_product = new_dom_element
            parentNode : menu
            nodeName   : "div" 
            className  : "indexMenuButton"
            txt        : "Solution"
            onclick: ( evt ) ->
                $(document.body).animate
                    scrollTop:   $('#solution').offset().top - 80
                    1500
        
        menu_product = new_dom_element
            parentNode : menu
            nodeName   : "div" 
            className  : "indexMenuButton"
            txt        : "Products"
            onclick: ( evt ) ->
                $(document.body).animate
                    scrollTop:   $('#products').offset().top - 80
                    1500
            
        menu_offer = new_dom_element
            parentNode : menu
            nodeName   : "div" 
            className  : "indexMenuButton"
            txt        : "Services"
            onclick: ( evt ) ->
                $(document.body).animate
                    scrollTop:   $('#services').offset().top - 80
                    1500
            
        menu_contact = new_dom_element
            parentNode : menu
            nodeName   : "div" 
            className  : "indexMenuButton"
            txt        : "Contact"
            onclick: ( evt ) ->
                $(document.body).animate
                    scrollTop:   $('#contact').offset().top - 80
                    1500
            
        menu_login = new_dom_element
            parentNode : menu
            nodeName   : "div" 
            className  : "indexMenuButton"
            txt        : "Login"
            style : 
                cssFloat : "right"
                color : "#4dbce9"
            onclick: ( evt ) ->
                window.location = "desk.html" 
            
            
        top = @add_part "top"
        top_size =  new_dom_element
            parentNode : top
            nodeName   : "div" 
            style      :
                height     : "30px"
 
    #presentation-----------------------------------------------------------------------
    create_presentation: ->
        presentation = @add_part "presentation", "#f6f6f6", "#262626"   
        presentation_video =  new_dom_element
            parentNode : presentation
            nodeName   : "div" 
            txt        : '<iframe width="853" height="480" src="//www.youtube.com/embed/K1MVV_nG8BI?rel=0" frameborder="0" allowfullscreen></iframe>'  
            style      :
                margin     : "0px 0 0 123px"
                float      : "left"
        
        presentation_title =  new_dom_element
            parentNode : presentation
            nodeName   : "div" 
            #txt        : 'Scientific SaaS Solution'  
            style      :
                width      : "100%"
                height     : "30px"
                textAlign  : "center"
                #fontWeight : "bold"
                fontSize   : "38px"
                color      : "#262626"
                float      : "left"
        
         
        #illustrations --------------------------------------
        illustration = @add_part "illustration", "#262626" , "#f6f6f6"
        
        biglogo = @add_col(1, illustration)
        new_dom_element
            parentNode : biglogo
            nodeName  : "img"
            src       : "img/biglogo.png"
            alt       : "logo"
            title     : "logo"
            style      :
                margin: "0 0 20px 0"
        
        ill1 = @add_col(4, illustration)
        new_dom_element
            parentNode : ill1
            nodeName  : "img"
            src       : "img/Correli.png"
            alt       : "Correli"
            title     : "Correli"
            
        ill2 = @add_col(4, illustration)
        new_dom_element
            parentNode : ill2
            nodeName  : "img"
            src       : "img/Mesh.png"
            alt       : "Mesh"
            title     : "Mesh"
            
        ill3 = @add_col(4, illustration)
        new_dom_element
            parentNode : ill3
            nodeName  : "img"
            src       : "img/Scills.png"
            alt       : "Scills"
            title     : "Scills"
            
        ill4 = @add_col(4, illustration)
        new_dom_element
            parentNode : ill4
            nodeName  : "img"
            src       : "img/Plot.png"
            alt       : "Plot"
            title     : "Plot"
            
            
    #company -----------------------------------------------------------------------------        
    create_team: ->
        team = @add_part "team", "#f6f6f6" ,  "#262626"  
        team_title =  new_dom_element
            parentNode : team
            nodeName   : "div" 
            txt        : 'Team' 
            className  : "indexcenterpartTitle"
                
        team1 = @add_col(2, team)
        new_dom_element
            parentNode : team1
            nodeName  : "img"
            src       : "img/team.png"
            alt       : "Jérémie Bellec"
            title     : "Jérémie Bellec"
        new_dom_element
            parentNode : team1
            nodeName   : "div"
            txt        : 'Jeremie Bellec : <br> CEO, PhD in mechanical engineering'  
            style      :
                width      : "100%"
        
        
        team2 = @add_col(2, team)
        new_dom_element
            parentNode : team2
            nodeName  : "img"
            src       : "img/team.png"
            alt       : "Hugo Leclerc"
            title     : "Hugo Leclerc"
        new_dom_element
            parentNode : team2
            nodeName   : "div"
            txt        : 'Hugo Leclerc : <br> Scientific advisor, PhD, CNRS'  
            style      :
                width      : "100%"
        
        #goal----------------------------------------------------------------------
        goal = @add_part "objectif", "#f6f6f6" ,  "#262626"  
        goal_title =  new_dom_element
            parentNode : goal
            nodeName   : "div" 
            txt        : 'Goals' 
            className  : "indexcenterpartTitle"
        new_dom_element
            parentNode : goal
            nodeName   : "div" 
            txt        : "<b>is'sim</b> was founded on the basis of several observations: <ul type='circle'>
                              <li>cost of simulation tools (software, hardware, maintenance) is too high</li>
                              <li> simulation solutions are inaccessible to a large number of small companies</li>
                              <li> new HPC needs lead to a demand for new and more flexible usages</li>
                              <li> digital data generated are more complex and numerous</li>
                              <li> these data must be exchanged, shared, interpreted by several teams</li>
                              <li> many specialised computing solutions are not available, they remain confined in laboratories or specialized companies</li>
                              <li> ... </li>
                          </ul>
                          <br> Our goals are ambitious: solve all of these problems with an efficient, simple and affordable solution !
                          <br> 
                          <br> For this end, we have designed <b>is'sim</b>  platform, accessible in SaaS mode and open to third party solutions. Best simulation applications will soon be available on demand, in a unified environment managing simulation data and interoperability between applications.
                          <br> 
                          <br> <b>is'sim</b> , the result of 6 years of development around the latest web and HPC technologies will revolutionize design projects based on simulation."  
            style      :
                textAlign  : "justify"
        
        #awards ---------------------------------------------------------
        partners = @add_part "partners","#f6f6f6" ,"#262626"   
        partners_title =  new_dom_element
            parentNode : partners
            nodeName   : "div" 
            txt        : 'Partners' 
            className  : "indexcenterpartTitle"
        
        col1 = @add_col(3, partners)
        new_dom_element
            parentNode : col1
            nodeName  : "img"
            src       : "img/logo_ministere.jpg"
            width     : "200"
        
        col2 = @add_col(3, partners)
        new_dom_element
            parentNode : col2
            nodeName  : "img"
            src       : "img/logo_BPI_France.png"
            width     : "200"
            
        new_dom_element
            parentNode : col2
            nodeName  : "img"
            src       : "img/logo_ESSONE.png"
            width     : "200"
        
        col3 = @add_col(3, partners)
        new_dom_element
            parentNode : col3
            nodeName  : "img"
            src       : "img/logo_ens.png"
            width     : "200"
        
        new_dom_element
            parentNode : col3
            nodeName  : "img"
            src       : "img/logo_incuballiance.png"
            width     : "200"

        #awards ---------------------------------------------------------
        awards = @add_part "awards","#f6f6f6" ,"#262626"   
        awards_title =  new_dom_element
            parentNode : awards
            nodeName   : "div" 
            txt        : 'Awards' 
            className  : "indexcenterpartTitle"
        
        cola1 = @add_col(2, awards)
        new_dom_element
            parentNode : cola1
            nodeName   : "div" 
            txt        : 'Innovative technologies <br> (French ministery of research, BPI France)' 
        new_dom_element
            parentNode : cola1
            nodeName  : "img"
            src       : "img/CCETI_oseo.png"
            width     : "200"
        
        
        cola2 = @add_col(2, awards)
        new_dom_element
            parentNode : cola2
            nodeName   : "div" 
            txt        : 'Innovative SME <br> (system@tic cluster)' 
        new_dom_element
            parentNode : cola2
            nodeName  : "img"
            src       : "img/logo_PME_innvante_systematic.png"
            width     : "200"
        
            
        
    
    #contact--------------------------------------------
    create_contact: ->
        contact = @add_part "contact", "#f6f6f6", "#262626"  
        contact.style.textAlign = "center"
        contact_title =  new_dom_element
            parentNode : contact
            nodeName   : "div" 
            txt        : 'Contact' 
            className  : "indexcenterpartTitle"
        new_dom_element
            parentNode : contact
            nodeName   : "div"
            txt        : "86 rue de Paris, 91400 Orcay, FRANCE"
            style      :
                width      : "100%"
                textAlign : "center"
        new_dom_element
            parentNode : contact
            nodeName   : "a"
            href       : "mailto:contact@structure-computation.com"
            txt        : "send a mail"
            style      :
                width     : "100%"
                textAlign : "center"
        new_dom_element
            parentNode : contact
            nodeName   : "div"
            txt        : '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2633.484965886882!2d2.1946309000000097!3d48.696210899999976!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e5d61facc30587%3A0xccaaa136fb1452e7!2s86+Rue+de+Paris!5e0!3m2!1sfr!2sfr!4v1404916614372" width="900" height="450" frameborder="0" style="border:0"></iframe>'
            style      :
                width      : "100%"
#                 margin     : "20px 0 20px 100px"

    #Solution--------------------------------------------
    create_solution: ->
        presentation = @add_part "solution", "#f6f6f6", "#262626"  
        solution.style.textAlign = "center"
        contact_title =  new_dom_element
            parentNode : solution
            nodeName   : "div" 
            txt        : 'Solution' 
            className  : "indexcenterpartTitle"
            
        #key idea ---------------------------------------        
        col1 = @add_col(3, presentation)
        new_dom_element
            parentNode : col1
            nodeName  : "img"
            src       : "img/solution_select.jpg"
            alt       : "Select"
            title     : "Select"
        new_dom_element
            parentNode : col1
            nodeName   : "div" 
            txt        : 'ONLINE SCIENTIFIC  <br> APPLICATIONS LIBRARY !'  
            className  : "presentationTitleCol"
        new_dom_element
            parentNode : col1
            nodeName   : "div" 
            txt        : 'Third party scientific applications <br>  All options available  <br>  Full web unified environment'  
            className  : "presentationTextCol"
        

        col2 = @add_col(3, presentation)
        new_dom_element
            parentNode : col2
            nodeName  : "img"
            src       : "img/solution_simulate.jpg"
            alt       : "Simulate"
            title     : "Simulate"
        new_dom_element
            parentNode : col2
            nodeName   : "div" 
            txt        : 'POWERFUL  <br> AND SIMPLE !'  
            className  : "presentationTitleCol"
        new_dom_element
            parentNode : col2
            nodeName   : "div" 
            txt        : 'Use tremendous HPC resources <br> On demand Simulation <br> Fluid 3D visualisation with WebGL'  
            className  : "presentationTextCol"   
            
            
        col3 = @add_col(3, presentation)
        new_dom_element
            parentNode : col3
            nodeName  : "img"
            src       : "img/solution_share.jpg"
            alt       : "Share"
            title     : "Share"
        new_dom_element
            parentNode : col3
            nodeName   : "div" 
            txt        : 'COLLABORATIVE  <br> IN REAL TIME !'  
            className  : "presentationTitleCol"
        new_dom_element
            parentNode : col3
            nodeName   : "div" 
            txt        : 'Collaborate on your 3D model in real time <br> Share immediately all your results <br> Full compatibility between applications'  
            className  : "presentationTextCol"
        
        #description ---------------------------------------   
        description = @add_part "description", "#262626", "#f6f6f6"  
        description.style.textAlign = "center"
        new_dom_element
            parentNode : description
            nodeName   : "div" 
            txt        : "<b>is'sim</b> is a real time collaborative solution for 3D simulations and engineering. This web-based operating system offers Platform as a Service to anyone needing to realise complex simulations. <b>is'sim</b> provide, in a unified environment, the best third party tools, standard scientific software as well as High Performance Computing software. All these tools are served by a unified interface and a unified data format. Associated with the power of cloud computing and centralization of computing means, software licenses and simulation data, <b>is'sim</b> is to become the first and most powerful scientific SaaS solution."  
            style      :
                textAlign  : "justify"
                
        biglogo = @add_col(1, description)
        new_dom_element
            parentNode : biglogo
            nodeName  : "img"
            src       : "img/biglogo.png"
            alt       : "logo"
            title     : "logo"
            style      :
                margin: "0 0 20px 0"
    
    #Products--------------------------------------------
    create_products: ->
        products = @add_part "products", "#f6f6f6", "#262626"  
        products.style.textAlign = "center"
        contact_title =  new_dom_element
            parentNode : products
            nodeName   : "div" 
            txt        : 'Products' 
            className  : "indexcenterpartTitle"
            
    #Services--------------------------------------------
    create_services: ->
        services = @add_part "services", "#f6f6f6", "#262626"  
        services.style.textAlign = "center"
        contact_title =  new_dom_element
            parentNode : services
            nodeName   : "div" 
            txt        : 'Services' 
            className  : "indexcenterpartTitle"
    
    #bottom of the page--------------------------------------------
    create_bottom: ->
        bottom = @add_part "bottom","#262626" ,"#f6f6f6"  
        team_title =  new_dom_element
            parentNode : bottom
            nodeName   : "div" 
            style      :
                width      : "100%"
                height     : "800px"
                textAlign  : "center"

    
    # index  ---------------------------------------------------------------------------------------------   
    create_index: ->
        @clear_page()
        
        #menu----------------------------------------------------------
        @create_menu()
        
        #presentation----------------------------------------------------------   
        @create_presentation()
        
        #team----------------------------------------------------------
        @add_part_separator()
        @create_team()
        
        #Solution----------------------------------------------------------
        @add_part_separator()
        @create_solution()
        
        #Products----------------------------------------------------------
        @add_part_separator()
        @create_products()
        
        #Services----------------------------------------------------------
        @add_part_separator()
        @create_services()
        
        #contact----------------------------------------------------------
        @add_part_separator()
        @create_contact()
        
        
        #page bottom----------------------------------------------------------
        @create_bottom()
        
        
        
       