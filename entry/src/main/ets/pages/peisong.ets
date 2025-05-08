import { router } from '@kit.ArkUI'

@Entry
@Component
struct peisong{
  private selectedDate: Date = new Date('2021-08-08')
  @State text:string='请选择供应日期'
  @State text1:string='~暂无相关数据~'
  build() {
    Stack() {
        Tabs() {
          TabContent() {
            Text(this.text1)
          }
          .tabBar('未配送')

          TabContent() {
            Text(this.text1)
          }
          .tabBar('配送中')

          TabContent() {
            Text(this.text1)
          }
          .tabBar('已收货')

          TabContent() {
            Text(this.text1)
          }
          .tabBar('已拒收')

          TabContent() {
            Text(this.text1)

          }
          .tabBar('已取消')
        }
        .border({
          width:{bottom:2}
        })

        Row({ space: 135 }) {
          Row() {
            Text(this.text)
              .fontSize(15)
            Image($r('app.media.down'))
              .width(20)
              .padding({ bottom: 5 })
          }
          .onClick(() => {
            DatePickerDialog.show({
              start: new Date("2000-1-1"),
              end: new Date("2100-12-31"),
              selected: this.selectedDate,
              onAccept: (value: DatePickerResult) => {
                if (value.year !== undefined && value.month !== undefined && value.day !== undefined) {
                  // 通过Date的setFullYear方法设置按下确定按钮时的日期，这样当弹窗再次弹出时显示选中的是上一次确定的日期
                  this.selectedDate.setFullYear(value.year, value.month, value.day);
                  // 格式化日期为年-月-日格式
                  const formattedDate = `${value.year.toString().padStart(4, '0')}-${(value.month + 1).toString()
                    .padStart(2, '0')}-${value.day.toString().padStart(2, '0')}`;
                  console.info("DatePickerDialog:onAccept()" + JSON.stringify(value));
                  // 这里假设你有一个变量来显示日期，例如 this.text
                  this.text = formattedDate;
                } else {
                  console.error('DatePickerResult 中的年、月或日属性未定义');
                }
              },
              onCancel: () => {
                console.info("DatePickerDialog:onCancel()");
              },
              onChange: (value: DatePickerResult) => {
                if (value.year !== undefined && value.month !== undefined && value.day !== undefined) {
                  console.info("DatePickerDialog:onChange()" + JSON.stringify(value));
                } else {
                  console.error('DatePickerResult 中的年、月或日属性未定义');
                }
              }
            });
          })

          Text("批量设置")
            .fontSize(15)
            .width(80)
            .height(40)
            .fontColor(Color.Green)
            .border({ width: 1.5, color: Color.Green })
            .borderRadius(5)
            .padding({ left: 7 })
        }
        .margin({ left: 10 })
        .padding({bottom:550})

      Image($r('app.media.557'))
        .width(40)
        .padding(3)
        .margin({left:300,top:200})
        .backgroundColor(Color.White)
        .onClick(()=>{
          router.pushUrl({url:'pages/Page'});
        })
    }
  }
}