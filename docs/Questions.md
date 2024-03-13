# 常见问题

#### 如何调节候选字大小/候选栏高度

「键盘设置」->「候选栏设置」，里面有对候选文字字体大小，候选字序号字体大小，候选字 Comment 字体大小的设置，还有对候选栏高度/编码区高度的设置。

#### 如何显示 RIME 返回的 Comment/候选项序号

「键盘设置」->「候选栏设置」，打开「显示候选项序号」，「显示候选 Comment」需要。

#### 如何将默认中文26键显示为小写字母

「键盘设置」->「键盘布局」->「中文26键」，点击「>」进入键盘详细设置页面。关闭「显示大写字母」选项。

#### 如何为默认中文26键的键盘增加`;`分号按键/中英切换按键/空格两侧自定义按键

「键盘设置」->「键盘布局」->「中文26键」，点击「>」进入键盘详细设置页面，里面有具体配置项。

#### 如何调整中文26键按键的划动

「键盘设置」->「键盘布局」->「中文26键」，点击「>」进入键盘详细设置页面，点击「划动设置」标签栏，您可以为已有按键设置上下左右不同划动设置。

如果您是要为新增空格两侧的按键设置划动，也是可以的。

1. 点击右上角「+」新增一个 “Action”，如果空格两侧新增按键勾选了「按键由 RIME 处理」，那么就选择「字符」，否则选择「符号」。
2. 在弹出框中填写您新增空格两侧按钮填写的符号，点击「保存」。
3. 在列表中找到您刚新增的 Action，点击进入划动设置详细页面。
4. 在此页面中添加您想设置的上下左右划动配置。

具体每一项的含义，您可以参考「自定义键盘」

#### 中文九宫格无法打字只能输入数字

键盘的布局与输入方案是密切相关的，一般的输入方案默认支持的都是 26 键布局。如果想使用中文九宫格，需要搭配支持九宫格的输入法一同使用。

「仓」默认内置的「雾凇」中包含有「雾凇·九宫格」输入方案，在选择中文 9 键布局后，请在输入方案中搭配选择此方案一同使用。

#### 如何屏蔽中文九宫格按键的划动

1. 新增 `hamster.custom.yaml` 文件，文件内容如下：

    ```yaml
    patch:
      swipe:
        keyboardSwipe/+:
            - keyboardType: chineseNineGrid
              keys: []
    ```

    > 注意：如果您自身已经有 `hamster.custom.yaml`文件了，这可以上面的 `patch`以下内容（不包含 `patch`，注意缩进）添加到自己的配置文件中。

2. 将文件上传至 `Rime` 目录中
3. 运行「RIME」下的「重新部署」

#### 内置键盘中文九宫格如何自定义按键划动配置

1. 新增 `hamster.custom.yaml` 文件，文件内容如下：

    ```yaml
    patch:
      swipe:
        keyboardSwipe:
        - keyboardType: chineseNineGrid
          keys:
            - action: { chineseNineGrid: { symbol: { char: "@/." } } }
              swipe:
                - direction: up
                  action: { symbol: { char: "1" } }
            - action: { chineseNineGrid: { symbol: { char: "ABC" } } }
              swipe:
                - direction: up
                  action: { symbol: { char: "2" } }
            - action: { chineseNineGrid: { symbol: { char: "DEF" } } }
              swipe:
                - direction: up
                  action: { symbol: { char: "3" } }
            - action: { chineseNineGrid: { symbol: { char: "GHI" } } }
              swipe:
                - direction: up
                  action: { symbol: { char: "4" } }
            - action: { chineseNineGrid: { symbol: { char: "JKL" } } }
              swipe:
                - direction: up
                  action: { symbol: { char: "5" } }
            - action: { chineseNineGrid: { symbol: { char: "MNO" } } }
              swipe:
                - direction: up
                  action: { symbol: { char: "6" } }
            - action: { chineseNineGrid: { symbol: { char: "PQRS" } } }
              swipe:
                - direction: up
                  action: { symbol: { char: "7" } }
            - action: { chineseNineGrid: { symbol: { char: "TUV" } } }
              swipe:
                - direction: up
                  action: { symbol: { char: "8" } }
            - action: { chineseNineGrid: { symbol: { char: "WXYZ" } } }
              swipe:
                - direction: up
                  action: { symbol: { char: "9" } }
            - action: space 
              swipe:
                - direction: up
                  action: { symbol: { char: "0" } }
    ```

    > 注意：如果您自身已经有 `hamster.custom.yaml`文件了，这可以上面的 `patch`以下内容（不包含 `patch`，注意缩进）添加到自己的配置文件中。

2. 将文件上传至 `Rime` 目录中
3. 运行「RIME」下的「重新部署」

#### 键盘划动容易误触怎么办

配置文件的划的设置中有两个参数，如下：

```yaml
# 划动相关配置
swipe:
  # 划动距离阈值，当划动的距离大于或等于此值时，才会识别为一次划动
  distanceThreshold: 40

  # 此值是正切角度的阈值，用来限制上下左右划动时的角度，如果太大容易误触
  # 默认为 15 度的正切值，即上下左右划的的角度不能超过 15 度
  # tan(10º) ≈ 0.176, tan(15º) ≈ 0.268, tan(30º) ≈ 0.577, tan(45º) = 1, tan(60º) ≈ 1.732
  tangentThreshold: 0.577
```

`40`的距离，经过测试不容易触发划动，除非刻意触发。同时适当调节正切值。上面两个参数的值是以是默认值，是测试不容易误触的阈值了，如过对于您还不理想，您可以在适当调节。


#### 如何使用类系统原生的数字键盘及符号键盘

「仓」默认的数字键盘为「九宫格布局」，符号键盘默认为「分类符号布局」。

如果您想使用类似系统的数字键盘和符号键盘，可关闭以下选项：

* 「键盘设置」->「数字九宫格」，关闭「启用数字九宫格」选项。
* 「键盘设置」->「分类符号键盘」，关闭「启用分类符号键盘」选项。


#### 自造词无法保存

如[文件管理-「应用文件」与「键盘文件」](FilesManager.html#应用文件与键盘文件)中所描述的，默认情况，键盘对「键盘文件」目录只能读，不能写，所以键盘生成的自造词文件是无法保存的。

如果您使用自造词功能，请务必为键盘开启「完全访问权限」

#### 如何永久保持简繁状态，直到手动切换简繁状态

永久保存状态需要有两个前提：

1. 对应输入方案中的 `switches` 中选项，需要屏蔽 `reset`。
2. 永久保持状态必须通过 `RimeSwitcher` 功能（F4）进行切换，不能通过快捷键或者指令进行切换。


设置方法：

1. 输入方案文件`xxx.schema.yaml`中修改 `switches` 选项, 屏蔽 `reset` 选项

  ```yaml
  switches:
    - name: ascii_mode
      states: [ 中, Ａ ]
      # reset: 0
    - name: ascii_punct # 中英标点
      states: [ ¥, $ ]
      # reset: 0
    - name: traditionalization
      states: [ 简, 繁 ]
      # reset: 0
    - name: emoji
      states: [ 💀, 😄 ]
      # reset: 1
    - name: full_shape
      states: [ 半角, 全角 ]
      # reset: 0
  ```

2. `default.yaml` 或者 `default.custom.yaml` 文件中添加或修改 `save_options` 选项，添加第一步中方案文件中 `switches/name` 对应的值。

  ```yaml
  # 方案选单相关
  switcher:
    caption: 「方案选单」
    hotkeys:
      - F4
      - Control+grave
      # - Alt+grave
      - Control+Shift+grave
    save_options:  # 开关记忆（方案中的 switches），从方案选单（而非快捷键）切换时会记住的选项，需要记忆的开关不能设定 reset
      - ascii_punct
      - traditionalization
      - emoji
      - full_shape
    fold_options: true            # 呼出时是否折叠，多方案时建议折叠 true ，一个方案建议展开 false
    abbreviate_options: true      # 折叠时是否缩写选项
    option_list_separator: ' / '  # 折叠时的选项分隔符
  ```


设置好后，在「仓」的键盘划动中，设置快捷指令`#RimeSwitcher`，此时在键盘中呼出选项菜单后，就可以永久保持对应选项的状态了。

> 注意：每次「重新部署」后，会丢失状态。

