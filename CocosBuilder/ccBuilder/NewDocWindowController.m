/*
 * CocosBuilder: http://www.cocosbuilder.com
 *
 * Copyright (c) 2011 Viktor Lidholt
 * Copyright (c) 2012 Zynga Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#import "NewDocWindowController.h"
#import "PlugInManager.h"

@implementation NewDocWindowController

@synthesize wStage, hStage,rootObjectType, rootObjectTypes, centeredStageOrigin;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (!self) return NULL;
    
    self.wStage = 480;
    self.hStage = 320;
    
    self.rootObjectTypes = [PlugInManager sharedManager].plugInsNodeNamesCanBeRoot;
    self.rootObjectType = [rootObjectTypes objectAtIndex:0];
    
    self.centeredStageOrigin = 0;
    
    return self;
}

- (IBAction)acceptSheet:(id)sender
{
    if ([[self window] makeFirstResponder:[self window]])
    {
        [NSApp stopModalWithCode:1];
    }
}

- (IBAction)cancelSheet:(id)sender
{
    [NSApp stopModalWithCode:0];
}

- (void) dealloc
{
    self.rootObjectType = NULL;
    [super dealloc];
}

@end
