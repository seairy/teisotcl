# -*- encoding : utf-8 -*-
User.create(account: 'admin', password: '123456', password_confirmation: '123456', role: User::RoleAdmin, name: '管理员', available: true)
Continent.create({ :name => '亚洲' })
Continent.create({ :name => '非洲' })
Continent.create({ :name => '欧洲' })
Continent.create({ :name => '美洲' })
Continent.create({ :name => '大洋洲' })
Country.create({ :continent_id => 1, :name => '中国' })
Country.create({ :continent_id => 1, :name => '阿富汗' })
Country.create({ :continent_id => 1, :name => '阿联酋' })
Country.create({ :continent_id => 1, :name => '亚美尼亚' })
Country.create({ :continent_id => 1, :name => '阿塞拜疆' })
Country.create({ :continent_id => 1, :name => '巴基斯坦' })
Country.create({ :continent_id => 1, :name => '菲律宾' })
Country.create({ :continent_id => 1, :name => '格鲁吉亚' })
Country.create({ :continent_id => 1, :name => '哈萨克斯坦' })
Country.create({ :continent_id => 1, :name => '韩国' })
Country.create({ :continent_id => 1, :name => '吉尔吉斯斯坦' })
Country.create({ :continent_id => 1, :name => '黎巴嫩' })
Country.create({ :continent_id => 1, :name => '马来西亚' })
Country.create({ :continent_id => 1, :name => '蒙古' })
Country.create({ :continent_id => 1, :name => '孟加拉国' })
Country.create({ :continent_id => 1, :name => '尼泊尔' })
Country.create({ :continent_id => 1, :name => '日本' })
Country.create({ :continent_id => 1, :name => '斯里兰卡' })
Country.create({ :continent_id => 1, :name => '泰国' })
Country.create({ :continent_id => 1, :name => '土耳其' })
Country.create({ :continent_id => 1, :name => '乌兹别克斯坦' })
Country.create({ :continent_id => 1, :name => '新加坡' })
Country.create({ :continent_id => 1, :name => '以色列' })
Country.create({ :continent_id => 1, :name => '伊朗' })
Country.create({ :continent_id => 1, :name => '印度尼西亚' })
Country.create({ :continent_id => 1, :name => '印度' })
Country.create({ :continent_id => 1, :name => '中国香港' })
Country.create({ :continent_id => 1, :name => '中国台湾' })
Country.create({ :continent_id => 1, :name => '缅甸' })
Country.create({ :continent_id => 1, :name => '塔吉克斯坦' })
Country.create({ :continent_id => 1, :name => '约旦' })
Country.create({ :continent_id => 1, :name => '柬埔寨' })
Country.create({ :continent_id => 1, :name => '老挝' })
Country.create({ :continent_id => 1, :name => '越南' })
Country.create({ :continent_id => 2, :name => '埃及' })
Country.create({ :continent_id => 2, :name => '博茨瓦纳' })
Country.create({ :continent_id => 2, :name => '津巴布韦' })
Country.create({ :continent_id => 2, :name => '喀麦隆' })
Country.create({ :continent_id => 2, :name => '肯尼亚' })
Country.create({ :continent_id => 2, :name => '卢旺达' })
Country.create({ :continent_id => 2, :name => '马达加斯加' })
Country.create({ :continent_id => 2, :name => '南非' })
Country.create({ :continent_id => 2, :name => '尼日利亚' })
Country.create({ :continent_id => 2, :name => '苏丹' })
Country.create({ :continent_id => 2, :name => '利比里亚' })
Country.create({ :continent_id => 2, :name => '摩洛哥' })
Country.create({ :continent_id => 2, :name => '马里' })
Country.create({ :continent_id => 2, :name => '多哥' })
Country.create({ :continent_id => 2, :name => '贝宁' })
Country.create({ :continent_id => 2, :name => '埃塞俄比亚' })
Country.create({ :continent_id => 2, :name => '突尼斯' })
Country.create({ :continent_id => 2, :name => '赞比亚' })
Country.create({ :continent_id => 2, :name => '坦桑尼亚' })
Country.create({ :continent_id => 2, :name => '塞内加尔' })
Country.create({ :continent_id => 2, :name => '莫桑比克' })
Country.create({ :continent_id => 2, :name => '布隆迪' })
Country.create({ :continent_id => 2, :name => '塞拉利昂' })
Country.create({ :continent_id => 3, :name => '爱尔兰' })
Country.create({ :continent_id => 3, :name => '爱沙尼亚' })
Country.create({ :continent_id => 3, :name => '奥地利' })
Country.create({ :continent_id => 3, :name => '白俄罗斯' })
Country.create({ :continent_id => 3, :name => '保加利亚' })
Country.create({ :continent_id => 3, :name => '比利时' })
Country.create({ :continent_id => 3, :name => '冰岛' })
Country.create({ :continent_id => 3, :name => '波兰' })
Country.create({ :continent_id => 3, :name => '丹麦' })
Country.create({ :continent_id => 3, :name => '德国' })
Country.create({ :continent_id => 3, :name => '俄罗斯' })
Country.create({ :continent_id => 3, :name => '法国' })
Country.create({ :continent_id => 3, :name => '芬兰' })
Country.create({ :continent_id => 3, :name => '荷兰' })
Country.create({ :continent_id => 3, :name => '捷克' })
Country.create({ :continent_id => 3, :name => '立陶宛' })
Country.create({ :continent_id => 3, :name => '罗马尼亚' })
Country.create({ :continent_id => 3, :name => '挪威' })
Country.create({ :continent_id => 3, :name => '塞尔维亚' })
Country.create({ :continent_id => 3, :name => '斯洛伐克' })
Country.create({ :continent_id => 3, :name => '葡萄牙' })
Country.create({ :continent_id => 3, :name => '瑞典' })
Country.create({ :continent_id => 3, :name => '乌克兰' })
Country.create({ :continent_id => 3, :name => '西班牙' })
Country.create({ :continent_id => 3, :name => '匈牙利' })
Country.create({ :continent_id => 3, :name => '意大利' })
Country.create({ :continent_id => 3, :name => '希腊' })
Country.create({ :continent_id => 3, :name => '英国' })
Country.create({ :continent_id => 3, :name => '马耳他' })
Country.create({ :continent_id => 3, :name => '摩尔多瓦' })
Country.create({ :continent_id => 3, :name => '斯洛文尼亚' })
Country.create({ :continent_id => 3, :name => '瑞士' })
Country.create({ :continent_id => 3, :name => '拉脱维亚' })
Country.create({ :continent_id => 3, :name => '克罗地亚' })
Country.create({ :continent_id => 4, :name => '加拿大' })
Country.create({ :continent_id => 4, :name => '美国' })
Country.create({ :continent_id => 4, :name => '墨西哥' })
Country.create({ :continent_id => 4, :name => '秘鲁' })
Country.create({ :continent_id => 4, :name => '哥伦比亚' })
Country.create({ :continent_id => 4, :name => '古巴' })
Country.create({ :continent_id => 4, :name => '智利' })
Country.create({ :continent_id => 4, :name => '阿根廷' })
Country.create({ :continent_id => 4, :name => '巴西 ' })
Country.create({ :continent_id => 4, :name => '哥斯达黎加' })
Country.create({ :continent_id => 4, :name => '牙买加' })
Country.create({ :continent_id => 4, :name => '巴哈马' })
Country.create({ :continent_id => 4, :name => '厄瓜多尔' })
Country.create({ :continent_id => 4, :name => '玻利维亚' })
Country.create({ :continent_id => 4, :name => '圭亚那' })
Country.create({ :continent_id => 5, :name => '澳大利亚' })
Country.create({ :continent_id => 5, :name => '新西兰' })
Country.create({ :continent_id => 5, :name => '斐济' })
