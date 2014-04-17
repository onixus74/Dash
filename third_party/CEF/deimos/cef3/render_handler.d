module deimos.cef3.render_handler;

// Copyright (c) 2014 Marshall A. Greenblatt. All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
//
//    * Redistributions of source code must retain the above copyright
// notice, this list of conditions and the following disclaimer.
//    * Redistributions in binary form must reproduce the above
// copyright notice, this list of conditions and the following disclaimer
// in the documentation and/or other materials provided with the
// distribution.
//    * Neither the name of Google Inc. nor the name Chromium Embedded
// Framework nor the names of its contributors may be used to endorse
// or promote products derived from this software without specific prior
// written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// ---------------------------------------------------------------------------
//
// This file was generated by the CEF translator tool and should not edited
// by hand. See the translator.README.txt file in the tools directory for
// more information.
//

extern(C) {

import deimos.cef3.base;
import deimos.cef3.browser;


///
// Implement this structure to handle events when window rendering is disabled.
// The functions of this structure will be called on the UI thread.
///
struct cef_render_handler_t
{
    ///
    // Base structure.
    ///
    cef_base_t base;

    ///
    // Called to retrieve the root window rectangle in screen coordinates. Return
    // true (1) if the rectangle was provided.
    ///
    extern(System) int function(    cef_render_handler_t* self,
                                    cef_browser_t* browser,
                                    cef_rect_t* rect) get_root_screen_rect;

    ///
    // Called to retrieve the view rectangle which is relative to screen
    // coordinates. Return true (1) if the rectangle was provided.
    ///
    extern(System) int function(    cef_render_handler_t* self,
                                    cef_browser_t* browser,
                                    cef_rect_t* rect) get_view_rect;

    ///
    // Called to retrieve the translation from view coordinates to actual screen
    // coordinates. Return true (1) if the screen coordinates were provided.
    ///
    extern(System) int function(    cef_render_handler_t* self,
                                    cef_browser_t* browser,
                                    int viewX,
                                    int viewY,
                                    int* screenX,
                                    int* screenY) get_screen_point;

    ///
    // Called to allow the client to fill in the CefScreenInfo object with
    // appropriate values. Return true (1) if the |screen_info| structure has been
    // modified.
    //
    // If the screen info rectangle is left NULL the rectangle from GetViewRect
    // will be used. If the rectangle is still NULL or invalid popups may not be
    // drawn correctly.
    ///
    extern(System) int function(    cef_render_handler_t* self,
                                    cef_browser_t* browser,
                                    cef_screen_info_t* screen_info) get_screen_info;

    ///
    // Called when the browser wants to show or hide the popup widget. The popup
    // should be shown if |show| is true (1) and hidden if |show| is false (0).
    ///
    extern(System) void function(   cef_render_handler_t* self,
                                    cef_browser_t* browser,
                                    int show) on_popup_show;

    ///
    // Called when the browser wants to move or resize the popup widget. |rect|
    // contains the new location and size.
    ///
    extern(System) void function(   cef_render_handler_t* self,
                                    cef_browser_t* browser,
                                    const(cef_rect_t)* rect) on_popup_size;

    ///
    // Called when an element should be painted. |type| indicates whether the
    // element is the view or the popup widget. |buffer| contains the pixel data
    // for the whole image. |dirtyRects| contains the set of rectangles that need
    // to be repainted. On Windows |buffer| will be |width|*|height|*4 bytes in
    // size and represents a BGRA image with an upper-left origin.
    ///
    extern(System) void function(   cef_render_handler_t* self,
                                    cef_browser_t* browser,
                                    cef_paint_element_type_t type,
                                    size_t dirtyRectsCount,
                                    const(cef_rect_t)* dirtyRects,
                                    const(void)* buffer,
                                    int width,
                                    int height) on_paint;

    ///
    // Called when the browser window's cursor has changed.
    ///
    extern(System) void function(   cef_render_handler_t* self,
                                    cef_browser_t* browser,
                                    cef_cursor_handle_t cursor) on_cursor_change;

    ///
    // Called when the scroll offset has changed.
    ///
    extern(System) void function(   cef_render_handler_t* self,
                                    cef_browser_t* browser) on_scroll_offset_changed;
}


}