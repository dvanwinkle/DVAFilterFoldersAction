//
//  DVAFilterFoldersAction.m
//  DVAFilterFoldersAction
//
//  Created by Dan VanWinkle on 4/1/14.
//  Copyright (c) 2014 Dan VanWinkle. All rights reserved.
//

#import "DVAFilterFoldersAction.h"

@implementation DVAFilterFoldersAction

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo {
    NSMutableArray *objectsToRemove = [NSMutableArray array];
    NSNumber *folderContentsFilter = [self.parameters valueForKeyPath:kDVAFolderContentsFilter];
    NSFileManager *defaultFileManager = [NSFileManager defaultManager];
    
    if ([folderContentsFilter integerValue] == 1) {
        for (NSString *path in input) {
            // We need to see if this is a directory first
            BOOL isDirectory;
            if ([defaultFileManager fileExistsAtPath:path isDirectory:&isDirectory] && isDirectory) {
                // This is a directory, proceed
                NSError *error;
                NSArray *contents = [defaultFileManager contentsOfDirectoryAtPath:path error:&error];
                if (contents && contents.count == 0) {
                    [objectsToRemove addObject:path];
                }
            }
        }
    } else if ([folderContentsFilter integerValue] == 2) {
        for (NSString *path in input) {
            // We need to see if this is a directory first
            BOOL isDirectory;
            if ([defaultFileManager fileExistsAtPath:path isDirectory:&isDirectory] && isDirectory) {
                // This is a directory, proceed
                NSError *error;
                NSArray *contents = [defaultFileManager contentsOfDirectoryAtPath:path error:&error];
                if (contents && contents.count != 0) {
                    [objectsToRemove addObject:path];
                }
            } else {
                [objectsToRemove addObject:path];
            }
        }
    }
    
    [input removeObjectsInArray:objectsToRemove];
    
	return input;
}

@end
