//
//  TPKeyboardAvoidingScrollView.h
//  Little Secrets
//
//  Created by Ivaylo Ivanov on 09.04.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TPKeyboardAvoidingScrollView : UIScrollView
- (BOOL)focusNextTextField;
- (void)scrollToActiveTextField;
@end
