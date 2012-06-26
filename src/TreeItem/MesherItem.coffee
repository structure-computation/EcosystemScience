#
class MesherItem extends TreeItem_Computable
    constructor: ( name = "Mesher" ) ->
        super()

        @add_attr
            _mesh        : new Mesh

        @add_attr
            visualization: @_mesh.visualization            
            cell_type    : new Choice( 0, [ "Triangle 3", "Triangle 6", "Quad 4",  "Quad 8" ] )
            base_size    : 100
            p_mesher     : new Lst

        @_name.set name
        @_ico.set "img/mesher.png"
        @_viewable.set true
        
        @visualization.point_edition.set false
    
        #         @size_X.bind =>
        #             if @link_size.get() == true
        #                 @size_Y.set @size_X.get()
        #     
        #         @size_Y.bind =>
        #             if @link_size.get() == true
        #                 @size_X.set @size_Y.get()
        
    cosmetic_attribute: ( name ) ->
        name in [ "visualization" ]
        
    add_point: ( p = new PointMesher ) ->
        if p instanceof PointMesher
            @p_mesher.push p            
    
    remove_point: ( p ) ->
        if p instanceof PointMesher
            ind = @p_mesher.indexOf p
            if ind != -1
                @p_mesher.splice ind, 1
            
        else if p isnt NaN # p is an indice
            @p_mesher.splice p, 1
        
    accept_child: ( ch ) ->
        ch instanceof MaskItem or 
        ch instanceof MesherItem or 
        ch instanceof SketchItem or 
        ch instanceof ImgItem or
        ch instanceof TransformItem
        
    sub_canvas_items: ->
        [ @_mesh ]
    
    draw: ( info ) ->
        if @p_mesher.length
            for pm in @p_mesher
                pm.draw info
        #we may need to add @_mesh.draw info and remove it from sub_canvas_items
    
    z_index: ->
        @_mesh.z_index()
        
    disp_only_in_model_editor: ->
#         @mesh

    get_movable_entities: ( res, info, pos, phase ) ->
        for pm in @p_mesher
            pm.get_movable_entities res, info, pos, phase
            
    on_mouse_down: ( cm, evt, pos, b ) ->
        for pm in @p_mesher
            pm.on_mouse_down cm, evt, pos, b
        return false
            
    on_mouse_move: ( cm, evt, pos, b, old ) ->
        for pm in @p_mesher
            pm.on_mouse_move cm, evt, pos, b, old
        return false
