#
class ShapeFunctionItem extends TreeItem
    constructor: ( name = "Shape Function" ) ->
        super()
        
        # attributes
        @add_attr
            code: new StrLanguage "Class Hello World\n   function this\n function that"
        
        # default values
        @_name.set name
        @_ico.set "img/mesh_24.png"
        @_viewable.set true
    
    accept_child: ( ch ) ->
        false
