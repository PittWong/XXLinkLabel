




#if __has_include(<XXLazyKit/XXLazyKitHeader.h>)

//FOUNDATION_EXPORT double XXKitVersionNumber;
//FOUNDATION_EXPORT const unsigned char XXKitVersionString[];

#import <XXLazyKit/NSDate+XXExtension.h>
#import <XXLazyKit/NSString+XXExtension.h>
#import <XXLazyKit/UIBarButtonItem+XXExtension.h>
#import <XXLazyKit/UIButton+XXExtension.h>
#import <XXLazyKit/UIColor+XXExtension.h>
#import <XXLazyKit/UIFont+XXExtension.h>
#import <XXLazyKit/UILabel+XXExtension.h>
#import <XXLazyKit/UIView+XXExtension.h>

#import <XXLazyKit/XXLazySetView.h>
#import <XXLazyKit/XXLazyCreateView.h>

#import <XXLazyKit/XXButtonLikeCell.h>
#import <XXLazyKit/XXLineChartView.h>
#import <XXLazyKit/XXColumnChartView.h>



#else

#import "NSDate+XXExtension.h"
#import "NSString+XXExtension.h"
#import "UIBarButtonItem+XXExtension.h"
#import "UIButton+XXExtension.h"
#import "UIColor+XXExtension.h"
#import "UIFont+XXExtension.h"
#import "UILabel+XXExtension.h"
#import "UIView+XXExtension.h"

#import "XXLazySetView.h"
#import "XXLazyCreateView.h"

#import "XXButtonLikeCell.h"
#import "XXLineChartView.h"
#import "XXColumnChartView.h"



#endif