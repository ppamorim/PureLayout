//
//  ALiOSDemo1ViewController.m
//  PureLayout Example-iOS
//
//  Copyright (c) 2015 Pedro Paulo Amorim
//  https://github.com/PureLayout/PureLayout
//

#import "ALiOSDemo1ViewCell.h"
#import <PureLayout/PureLayout.h>

@interface ALiOSDemo1ViewCell ()

@property (nonatomic, strong) UILabel *title;

@property (nonatomic, assign) BOOL didSetupConstraints;

@end

@implementation ALiOSDemo1ViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  
    self.contentView.backgroundColor = [UIColor yellowColor];
  
    [self.contentView addSubview:self.title];
  
    [self.contentView setNeedsUpdateConstraints]; // bootstrap Auto Layout
    return self;
}

- (void)updateConstraints
{
    // Check a flag didSetupConstraints before creating constraints, because this method may be called multiple times, and we
    // only want to create these constraints once. Without this check, the same constraints could be added multiple times,
    // which can hurt performance and cause other issues. See Demo 7 (Animation) for an example of code that runs every time.
    if (!self.didSetupConstraints) {
        //Center the title on the center of cell
        [self.title autoPinEdgesToSuperviewEdges];

        self.didSetupConstraints = YES;
    }
  
    [super updateConstraints];
}

- (UILabel *)title
{
    if (!_title) {
        _title = [UILabel newAutoLayoutView];
        _title.backgroundColor = [UIColor blueColor];
    }
    return _title;
}

@end
