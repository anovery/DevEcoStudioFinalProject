//入住申请页面
import { AdmissionItemType, AdmissionItemList } from '../viewmodel/AdmissionData';
import AdmissionListView from '../view/AdmissionListView';

//Admission()的入口函数
@Builder
export function AdmissionBuilder() {
  Admission()
}

@Component
struct Admission {
  pathStack: NavPathStack = AppStorage.get("pathStack") as NavPathStack;

  aboutToAppear(): void {
    // 初始化入住申请列表到AppStorage(如果还没有初始化)
    if (!AppStorage.has('admissionList')) {
      AppStorage.setOrCreate('admissionList', AdmissionItemList);
    }
  }

  // 处理申请入住按钮点击事件
  handleApplyClick(): void {
    this.pathStack.pushPathByName('AdmissionForm', null);
  }

  // 处理卡片点击事件 (未来可扩展查看详情功能)
  handleItemClick(item: AdmissionItemType): void {
    // 暂时不处理,未来可跳转到详情页
    console.log('点击了入住申请:', item.patientName);
  }

  build() {
    NavDestination() {
      Column() {
        // 页面标题
        Text('入住申请')
          .width('100%')
          .padding({ left: '16vp', top: '16vp', bottom: '12vp' })
          .fontWeight(700)
          .fontSize('24fp')
          .fontColor('#333333')

        // 入住申请列表视图
        AdmissionListView({
          onApplyClick: () => {
            this.handleApplyClick();
          },
          onItemClick: (item: AdmissionItemType) => {
            this.handleItemClick(item);
          }
        })
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#F1F3F5')
    }
    .hideTitleBar(false) //如果为true就没有返回的箭头
  }
}
