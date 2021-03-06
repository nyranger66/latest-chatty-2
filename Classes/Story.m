//
//    Story.m
//    LatestChatty2
//
//    Created by Alex Wayne on 3/16/09.
//    Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Story.h"


@implementation Story

@synthesize title;
@synthesize preview;
@synthesize body;
@synthesize date;
@synthesize commentCount;

- (id)initWithCoder:(NSCoder *)coder {
    [super initWithCoder:coder];
    
    self.title   = [coder decodeObjectForKey:@"title"];
    self.preview = [coder decodeObjectForKey:@"preview"];
    self.body    = [coder decodeObjectForKey:@"body"];
    self.date    = [coder decodeObjectForKey:@"date"];
    commentCount = [coder decodeIntForKey:@"commentCount"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [super encodeWithCoder:encoder];
    [encoder encodeObject:title     forKey:@"title"];
    [encoder encodeObject:preview   forKey:@"preview"];
    [encoder encodeObject:body      forKey:@"body"];
    [encoder encodeObject:date      forKey:@"date"];
    [encoder encodeInt:commentCount forKey:@"commentCount"];
}

+ (NSString *)formatDate:(NSDate *)date {
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateFormat:@"MMM d hh:mm a"];
    return [formatter stringFromDate:date];
}

+ (ModelLoader *)findAllWithDelegate:(id<ModelLoadingDelegate>)delegate {
    return [self loadAllFromUrl:@"/stories" delegate:delegate];
}

+ (ModelLoader *)findById:(NSUInteger)aModelId delegate:(id<ModelLoadingDelegate>)delegate {
    NSString *url = [NSString stringWithFormat:@"/stories/%i", aModelId];
    return [self loadObjectFromUrl:url delegate:delegate];
}

- (id)initWithDictionary:(NSDictionary *)dictionary {
    [super initWithDictionary:dictionary];
    
    self.title   = [[dictionary objectForKey:@"name"] stringByUnescapingHTML];
    self.preview = [[dictionary objectForKey:@"preview"] stringByUnescapingHTML];
    self.body    = [dictionary objectForKey:@"body"];
    self.date    = [[self class] decodeDate:[dictionary objectForKey:@"date"]];
    commentCount = [[dictionary objectForKey:@"comment_count"] intValue];
    
    return self;
}

- (void)dealloc {
    self.title = nil;
    [preview release];
    [body release];
    [date release];
    [super dealloc];
}

@end
