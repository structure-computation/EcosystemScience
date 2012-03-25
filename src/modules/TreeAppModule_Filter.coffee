#
class TreeAppModule_Filter extends TreeAppModule
    constructor: ->
        super()
        
        @name = 'Filter'
        
        _ina = ( app ) =>
            app.data.focus.get() != app.selected_canvas_inst()?[ 0 ]?.cm.view_id and 
            app.data.focus.get() != app.treeview.view_id
            
        @actions.push
            ico: "img/material_selection.png"
            siz: 1
            ina: _ina
            txt: "Select part of material"
            fun: ( evt, app ) ->
                console.log "material selection"
            key: [ "Shift+Z" ]
            
        @actions.push
            ico: "img/cutting_plan.png"
            siz: 1
            ina: _ina
            txt: "Cut 3D shape with a plan"
            fun: ( evt, app ) ->
                console.log "cutting plan"
            key: [ "Shift+P" ]
            