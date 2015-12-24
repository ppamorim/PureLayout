//
//  ALiOSDemo1ViewController.m
//  PureLayout Example-iOS
//
//  Copyright (c) 2014-2015 Pedro Paulo de Amorim
//  https://github.com/PureLayout/PureLayout
//

#import "ALiOSDemo11ViewController.h"
#import <PureLayout/PureLayout.h>

@interface ALiOSDemo11ViewController ()

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) BOOL didSetupConstraints;

@property (nonatomic, strong) NSArray *items;

@end

@implementation ALiOSDemo11ViewController

- (void)loadView
{
  self.view = [UIView new];
  self.view.backgroundColor = [UIColor colorWithWhite:0.1 alpha:1.0];
  self.items = @[@"item 1", @"item 2", @"item 3", @"item 4"];
  
  [self.view addSubview:self.tableView];
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  [self.view setNeedsUpdateConstraints]; // bootstrap Auto Layout
}

- (void)updateViewConstraints
{
  // Check a flag didSetupConstraints before creating constraints, because this method may be called multiple times, and we
  // only want to create these constraints once. Without this check, the same constraints could be added multiple times,
  // which can hurt performance and cause other issues. See Demo 7 (Animation) for an example of code that runs every time.
  if (!self.didSetupConstraints) {
    // TableView will be pinned on the sides of the screen.
    [self.tableView autoPinEdgesToSuperviewEdges];
    
    self.didSetupConstraints = YES;
  }
  
  [super updateViewConstraints];
}

- (UITableView *)tableView
{
  if (!_tableView) {
    _tableView = [UITableView newAutoLayoutView];
    [_tableView registerClass:[ALiOSDemo1ViewCell class] forCellReuseIdentifier:@"ALiOSDemo1ViewCell"];
  }
  return _tableView;
}


#pragma mark - TableView DataSource Implementation

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [_items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *cellIdentifier = @"ALiOSDemo1ViewCell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  if (cell == nil)
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
  return cell;
}


@end
