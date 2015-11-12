# CJPopupView
UIView的Category，用于弹出自定义的UIView
 (Using this class to popup your custom view)

#How to use
```
#import <UIView+CJPopupView.h>

NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"PopupFindPasd" owner:self options:nil];
UIView *view = [bundle lastObject];
[view showInLocationType:CJPopupViewLocationBottom animationType:CJPopupViewAnimationNone];
```

