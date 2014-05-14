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
class LoginBar extends View
    constructor: ( @el, user_email ) ->
        @he = new_dom_element
            parentNode: @el
            nodeName   : "div"
            style:
                position: "absolute"
                left    : 0
                right   : 0
                top     : "0px"
                height  : "30px"
                withd   : "100%"
                
                
        logo_div = new_dom_element
            parentNode: @he
            nodeName   : "div"
            className  : "logo"
        
        logout_div = new_dom_element
            parentNode: @he
            nodeName   : "div"
            className  : "logout_div"
            onmousedown: ( evt ) =>
                $.removeCookie("password", { path: '/' });
                window.location = "login.html"
                
        user_div = new_dom_element
            parentNode: @he
            nodeName   : "div"
            txt        : user_email
            style:
                cssFloat : "right"
                height  : "25px"
                paddingTop : 5
                fontSize   : "15px"
                textAlign  : "right"