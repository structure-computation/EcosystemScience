#
class BoundariesSelectionItem extends TreeItem
    constructor: ( ) ->
        super()
    
    z_index: ->
        return 1
    
    is_app_data: ( item ) ->
        if item instanceof TreeAppData
            return true
        else
            return false
    
    #get app_data
    get_app_data: ->
        #get app_data
        it = @get_parents_that_check @is_app_data
        return it[ 0 ]
        
    add_child_mesh : ( res ) ->
        app_data = @get_app_data()
        
#         # check if a Sketch Item already exist
#         m = app_data.get_child_of_type this, SketchItem
#         if m != false and m.length > 0
#             #check if it SketchItem is a child of PickedZoneItem
#             pzi = app_data.get_child_of_type this, PickedZoneItem
#             app_data.watch_item pzi
#             m.mesh = res[ 0 ].prov
#             if pzi != false and pzi.length > 0
#                 return [ pzi, m[ 0 ].mesh ]
#             else
#                 # create PickedZoneItem
#                 pzi = new PickedZoneItem @_border_type
#                 @add_child pzi
#                 pzi.add_child m
#                 app_data.watch_item pzi
#                 
#                 return [ pzi, m[ 0 ].mesh ]
#             
#         # else create one PickedZoneItem and SketchItem
#         else

        @pzi = new PickedZoneItem @_border_type
        @add_child @pzi
        @ski = new SketchItem
        @pzi.add_child @ski
        @ski.mesh = res[ 0 ].prov
        m = @pzi._children[ 0 ].mesh
        
        #close item
        path_item = app_data.get_root_path this
        app_data.close_item path_item[ 0 ]
        app_data.watch_item @pzi
        
        return [ @pzi, m ]
            
    delete_from_tree: ( app_data,  item ) ->
        #delete children
        for c in item._children
            if c._children.length > 0
                @delete_from_tree app, c
            item.rem_child c
            app_data.closed_tree_items.remove c
            for p in app_data.panel_id_list()
                app_data.visible_tree_items[ p ].remove c
        
        this.rem_child item
        app_data.closed_tree_items.remove item
        for p in app_data.panel_id_list()
            app_data.visible_tree_items[ p ].remove item
            
        
        
        
    on_mouse_down: ( cm, evt, pos, b ) ->
        if b == "LEFT"
            if cm._flat?
                res = []
                app_data = @get_app_data()                
                
                for ch in @_children when ch instanceof PickedZoneItem
                    ch.get_movable_entities res, cm.cam_info, pos, 1, true
                
                if res.length
                    # delete movable entities who are in mesh but not in picked zone item
                    l = res.length
                    for i in [ l - 1 .. 0 ]
                        touched_elem = res[ i ]
                        if touched_elem.item[ 0 ].model_id not in touched_elem.pzi.lines.get()
                            res.splice i, 1
                
                if res.length
                    res.sort ( a, b ) -> b.dist - a.dist
#                     console.log "line deleted"
                    @delete_from_tree app_data, res[ 0 ].pzi
                    return true
                        
                else
                    for el in cm._flat when el instanceof Mesh
                        if el.lines and el.get_movable_entities?
                            # closest entity under mouse
                            el.get_movable_entities res, cm.cam_info, pos, 1, true
                            
                
                    if res.length
                        res.sort ( a, b ) -> b.dist - a.dist
                        @_may_need_snapshot = true
#                         console.log "line selected"
                        line = res[ 0 ].item[ 0 ]
                        [ pzi, m ] = @add_child_mesh res
                        
                        pzi.points.push res[ 0 ].item[ 1 ].model_id
                        pzi.points.push res[ 0 ].item[ 2 ].model_id
                        pzi.lines.push line.model_id
                            
                    return true
                    
        return false
        
    on_mouse_move: ( cm, evt, pos, b ) ->
        if cm._flat?
            res = []
            for el in cm._flat when el instanceof Mesh
                if el.lines?
                    # closest entity under mouse
                    el.get_movable_entities res, cm.cam_info, pos, 1, true
                    
        app_data = @get_app_data()
        session = app_data.selected_session()
        sketch_child = app_data.get_child_of_type session, SketchItem
        if sketch_child != false and sketch_child.length > 0
            for sc in sketch_child
                sc.mesh._pre_sele.clear()
            
        if res.length
            res.sort ( a, b ) -> b.dist - a.dist
            
            @_may_need_snapshot = false
            line = res[ 0 ].item[ 0 ]
            P0   = res[ 0 ].item[ 1 ]
            P1   = res[ 0 ].item[ 2 ]
            if line not in res[ 0 ].prov._pre_sele
                res[ 0 ].prov._pre_sele.push line