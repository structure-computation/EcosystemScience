#
class DiscretizationItem extends TreeItem
    constructor: ->
        super()
        
        # default values
        @_name.set "Discretization"
        @_ico.set "img/discretization_16.png"
        @_viewable.set false
#         @add_child new SketchItem
    
    accept_child: ( ch ) ->
        ch instanceof MaskItem or 
        ch instanceof SketchItem or 
        ch instanceof ImgItem
        
    z_index: ->
        #could call z_index() of child
        
    sub_canvas_items: ->
        [ ]