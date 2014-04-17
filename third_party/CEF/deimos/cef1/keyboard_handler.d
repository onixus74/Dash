module deimos.cef1.keyboard_handler;

// Copyright (c) 2012 Marshall A. Greenblatt. All rights reserved.
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

// #ifndef CEF_INCLUDE_CAPI_CEF_KEYBOARD_HANDLER_CAPI_H_
// #pragma once

// #ifdef __cplusplus
extern(C) {
// #endif

import deimos.cef1.base;


///
// Implement this structure to handle events related to keyboard input. The
// functions of this structure will be called on the UI thread.
///
struct cef_keyboard_handler_t {
  ///
  // Base structure.
  ///
  cef_base_t base;

  ///
  // Called when the browser component receives a keyboard event. This function
  // is called both before the event is passed to the renderer and after
  // JavaScript in the page has had a chance to handle the event. |type| is the
  // type of keyboard event, |code| is the windows scan-code for the event,
  // |modifiers| is a set of bit- flags describing any pressed modifier keys and
  // |isSystemKey| is true (1) if Windows considers this a 'system key' message
  // (see http://msdn.microsoft.com/en-us/library/ms646286(VS.85).aspx). If
  // |isAfterJavaScript| is true (1) then JavaScript in the page has had a
  // chance to handle the event and has chosen not to. Only RAWKEYDOWN, KEYDOWN
  // and CHAR events will be sent with |isAfterJavaScript| set to true (1).
  // Return true (1) if the keyboard event was handled or false (0) to allow
  // continued handling of the event by the renderer.
  ///
  extern(System) int function(cef_keyboard_handler_t* self, cef_browser_t* browser, cef_handler_keyevent_type_t type, int code, int modifiers, int isSystemKey, int isAfterJavaScript) on_key_event;
}


// #ifdef __cplusplus
}
// #endif

// #endif CEF_INCLUDE_CAPI_CEF_KEYBOARD_HANDLER_CAPI_H_
