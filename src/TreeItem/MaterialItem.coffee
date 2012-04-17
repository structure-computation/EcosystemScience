#
class MaterialItem extends TreeItem
    constructor: ->
        super()
        
        # default values
        @_name.set "Material"
        @_ico.set "img/material_16.png"
        @_viewable.set false
        
        # attributes
        @add_attr
            code: new StrLanguage("
Class Steel\n
    Poisson := 0.28\n
    Young := 210\n", "ruby", @parse_code_onchange)
    
        @lst_variables = new Lst
        @old_lst_variables = new Lst
        @lst_variables_value = new Lst
        @parse_code_onchange()
        
    accept_child: ( ch ) ->
        ch instanceof MaskItem or 
        ch instanceof PickedZoneItem or
        ch instanceof DiscretizationItem or
        ch instanceof SketchItem or 
        ch instanceof MeshItem or 
        ch instanceof ImgSetItem or
        ch instanceof ImgItem
                
        
    sub_canvas_items: ->
        []
        
#     parse_code_onchange: =>
#         # first delete all variables from textarea
# #         for attr in @lst_variables
# #             @rem_attr attr.get() # focus seems to be loose when deleting
#         @lst_variables.clear()
#         
#         # then search all variables of type string := value
#         reg = /(\w+?) *:= *([0-9\.]+)/g # option g select all occurrence
#         i = 0
#         while reg.exec @code.get()
#             if i > 1000
#                 console.error 'Too much variables'
#                 break
#             console.log 'variable ',  RegExp.$1 ,' founded, value :', RegExp.$2
#             variable = RegExp.$1
#             variable_value = parseFloat RegExp.$2
#             # add founded variable as attributes
#             if not @[ variable ]?                                 # if variable doesn't exist
#                 @add_attr variable, [ variable_value, false ]
#                 @lst_variables.push variable
#             else # never call
#                 @set_attr @[ variable ], variable_value
#                 
#             i++
    parse_code_onchange: =>
        # search all variables of type string := value
        reg = /(\w+?) *:= *([0-9\.]+)/g # option g select all occurrence
        i = 0
        @old_lst_variables = @lst_variables
        @lst_variables.clear()
        while reg.exec @code.get()
            if i > 1000
                console.error 'Too much variables'
                break
            console.log 'variable ',  RegExp.$1 ,' founded, value :', RegExp.$2
            variable = RegExp.$1
            variable_value = parseFloat RegExp.$2
            @lst_variables.push variable
            @lst_variables_value.push variable_value
            i++
            
            
        for variable, i in @lst_variables
            if not @[ variable ]?                                 # if variable doesn't exist
                @add_attr variable, [ @lst_variables_value[ i ], false ]
            else
                @mod_attr @[ variable ], @lst_variables_value[ i ]
                
        for variable in @old_lst_variables when variable not in @lst_variables
            @rem_attr @[ variable ] # focus seems to be loose when deleting
            
        