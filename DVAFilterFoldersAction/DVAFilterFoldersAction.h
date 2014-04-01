//
//  DVAFilterFoldersAction.h
//  DVAFilterFoldersAction
//
//  Created by Dan VanWinkle on 4/1/14.
//  Copyright (c) 2014 Dan VanWinkle. All rights reserved.
//

#import <Automator/AMBundleAction.h>

static NSString *const kDVAFolderContentsFilter = @"DVAFolderContentsFilter";

@interface DVAFilterFoldersAction : AMBundleAction

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo;

@end
