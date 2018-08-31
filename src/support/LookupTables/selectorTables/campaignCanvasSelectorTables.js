/**
 * Created by adamShanahan on 5/15/18.
 */

const campaignCanvas = {
  'Campaign Name Banner': '.bar__label___1hb0n',
  'Delivery_Campaign_Banner': '.style__label___2bKHE',


  // Creative Graph Elements
  'Creative Graph': '.style__containerBox___2_qyj',
  'Engagement Experience': '.EngagementCard__container',

  'Canvas Toggle Button': '.bar__topBar___2WAlG >div:nth-child(2) >button:nth-child(2) >span.fa-align-left',

  'Create Creative Group Icon': '.journeyTools__list___2WKgJ >li:nth-child(1)',
  'Create Creative Icon': '.journeyTools__list___2WKgJ >li:nth-child(2)',

  'Create Targeting Icon': '.journeyTools__list___2WKgJ >li:nth-child(3)',

  'Create Tracking Icon': '.journeyTools__list___2WKgJ >li:nth-child(4)',

  'Create Engagement Card': '.journeyTools__list___2WKgJ >li:nth-child(5)',

  'Engagement Experience Type Section': '.style__radioGroupLabel___3rz9i',
  'Engagement Type Disable': 'label[for*="disable"]',

  'Disable Option': '.form__flexRow___3cThm:nth-child(2) .style__radioGroupPadding___3jr4c >div:nth-child(4)',

  'Engagement Type Disable Option': 'Input[value="disable"]',
  'Engagement Type Traditional': 'label[for*="traditional"]',
  'Engagement Type CTA': 'label[for*="Default"]',

  'Video Type': '.form__flexRow___3cThm:nth-child(2) .form__col___3CJjJ:nth-child(1) .Select',
  'Edit Video Type': '.form__flexRow___3cThm:nth-child(2) .form__col___3CJjJ:nth-child(1) .Select',
  'Video Type YT_URL': '.Select-menu-outer .Select-option[id$="--option-0"]',
  'Video Type LL_Raw file': '.Select-menu-outer .Select-option[id$="--option-1"]',
  'Video Type VAST_URL': '.Select-menu-outer .Select-option[id$="--option-0"]',
  'Video Type VAST_XML': '.Select-menu-outer .Select-option[id$="--option-1"]',
  'Duration Tag in VAST XML generated': 'div[id="collapsible5"] >div >div[class="collapsible-content"] >div >span[class="text"]',
  'CTA Section Checkbox': 'label[for*="callToAction.enabled"]',
  'Video Controls Label': 'label[for*="videoControls"]',
  'Video Controls Checkbox': 'Input[id=\'videoControls\']',

  'LL_Video_Upload': '.style__fileInput___2W1SY',

  'Video Controls Section': '.style__boxContainer___vMsTX:nth-child(1)',

  'Play/Pause Label': 'label[for*="enablePlayPause"]',
  'Mute/Unmute Label': 'label[for*="enableVolumeOnOff"]',
  'Expand Label': 'label[for*="enableExpand"]',
  'Counter Label': 'label[for*="enableCounter"]',
  'Progress Bar Label': 'label[for*="enableScrubBar"]',

  'Play/Pause Checkbox': 'Input[id=\'enablePlayPause\']',
  'Mute/Unmute Checkbox': 'Input[id=\'enableVolumeOnOff\']',
  'Expand Checkbox': 'Input[id=\'enableExpand\']',
  'Counter Checkbox': 'Input[id=\'enableCounter\']',
  'Progress Bar Checkbox': 'Input[id=\'enableScrubBar\']',


  'Text Shadow Checkbox': 'label[for*="callToAction.textShadow"]',
  'Text Shadow Checkbox Status': 'input[id="callToAction.textShadow"]',
  'CTA Header Color Icon': '.ReactCollapse--collapse > div > div > div:nth-child(3) > div:nth-child(1) > div > div:nth-child(2) > div:nth-child(2) > div > div',
  'Line2 Color Icon': '.ReactCollapse--collapse div:nth-child(3) > div:nth-child(2) > div:nth-child(2) > div:nth-child(2) > div > div',
  'Line3 Color Icon': '.ReactCollapse--collapse > div > div > div:nth-child(4) > div:nth-child(1) > div > div:nth-child(2) > div:nth-child(2) > div > div',
  'Message Font Color Icon': '.ReactCollapse--collapse > div > div >div:nth-child(2) > div:nth-child(2) > div:nth-child(2) > div > div > div',
  'Close Message Font Color Icon': '.ReactCollapse--collapse > div > div >div:nth-child(2) > div:nth-child(2) > div:nth-child(2) > div:nth-child(2)',
  'CTA Button Font Color Icon': '.ReactCollapse--collapse > div > div >div:nth-child(3) > div:nth-child(1) > div > div:nth-child(2) > div:nth-child(2) > div > div',
  'Close CTA Button Font Color Icon': '.ReactCollapse--collapse > div > div >div:nth-child(3) > div:nth-child(1) > div > div:nth-child(2) > div:nth-child(2)',
  'CTA Button Color Icon': '.ReactCollapse--collapse > div > div >div:nth-child(3) > div:nth-child(1) > div > div:nth-child(2) > div:nth-child(3) > div > div',
  'Close CTA Button Color Icon': '.ReactCollapse--collapse > div > div >div:nth-child(3) > div:nth-child(1) > div > div:nth-child(2) > div:nth-child(3)',


  'Sketch_Picker': '.chrome-picker', // Currently called .chrome-picker even in Firefox
  'Sketch_Picker Color Selector': '.chrome-picker  > div > div',
  'RGBA red input': '.flexbox-fix:nth-child(2) > div > div:nth-child(1) input',
  'RGBA green input': '.flexbox-fix:nth-child(2) > div > div:nth-child(2) input',
  'RGBA blue input': '.flexbox-fix:nth-child(2) > div > div:nth-child(3) input',
  'RGBA alpha input': '.flexbox-fix:nth-child(2) > div > div:nth-child(4) input',

  'change color picker arrow': '.chrome-picker svg',
  'Sketch_Picker Hue Bar': '.hue-horizontal',
  'Sketch_Picker Opacity Bar': '.chrome-picker > div:nth-child(2) > div:nth-child(1) > div:nth-child(2) > div:nth-child(2)',
  'CTA Header Text': '[name="callToAction.header"]',
  'Sketch_Picker Bottom Arrow': 'svg > path:nth-child(2)',
  'Sketch_Picker HEX': '.flexbox-fix:nth-child(2) input',

  'Line2 Text': '[name="callToAction.line2"]',
  'Line3 Text': '[name="callToAction.line3"]',

  'EC Type Thank you CTA Header': '[name="titleMessage"]',
  'EC Type Thank you CTA Button': '[name="ctaBtnText"]',
  'EC Type Thank you CTA Button Hyperlink': '[name="ctaBtnLink"]',
  'EC Type Thank you CTA Font': '.Select-placeholder',
  'Edit Thank you CTA Font': '.Select-value',
  'EC Type Thank you CTA Font Value': '.Select-menu-outer .Select-option[id$="--option-5"]',
  'EC Type Thank you CTA Font Value#6': '.Select-menu-outer .Select-option[id$="--option-6"]',

  'CTA destinationUrl': '[name="callToAction.destinationUrl"]',
  'CTA Font': '.form__flexRow___3cThm:nth-child(1) .Select-placeholder',
  'Edit CTA Font': '.form__flexRow___3cThm:nth-child(1) .Select',
  'CTA Font Value': '.Select-menu-outer .Select-option[id$="--option-5"]',
  'Edit CTA Font Value': '.Select-menu-outer .Select-option[id$="--option-3"]',

  'Close CTA Header Color Picker': '.ReactCollapse--collapse > div > div > div:nth-child(3) > div:nth-child(1) > div > div:nth-child(2) > div:nth-child(2)',
  'Close CTA Line3 Color Picker': '.ReactCollapse--collapse > div > div > div:nth-child(4) > div:nth-child(1) > div > div:nth-child(2) > div:nth-child(2)',
  'Close CTA Line2 Color Picker': '.ReactCollapse--collapse > div > div > div:nth-child(3) > div:nth-child(2) > div > div:nth-child(2)',

  'CTA_destinationUrl_Validation': '.validation__error___jw1Ll',
  'CTA Hyperlink_Validation': '.form__flexRow___3cThm:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(3) .form__col___3CJjJ:nth-child(2) .validation__error___jw1Ll',
  'EC Type Thank you CTA Font_Validation': '.form__flexRow___3cThm:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(2) .form__col___3CJjJ:nth-child(1) .validation__error___jw1Ll',

  // / Graph Elements
  'Start Node_Campaign Name': '.StartNode__title',
  'Line_Item': '.joint-type-vg-lineitem',
  'Start Node Title in Graph': '.StartNode__titleText',
  'Joint Link': '.joint-link',
  'Start Node joint-port': 'g[data-pseudo-id="STARTNODE"] .joint-port',
  'Line_Item Top joint-port': 'g[data-pseudo-id="LINE_ITEM-Line Item 1"] .joint-port g[port-group="top"]',
  'Line_Item Bottom joint-port': 'g[data-pseudo-id="LINE_ITEM-Line Item 1"] .joint-port g[port-group="bottom"]',
  'marker-target': '.marker-target',
  'marker-source': '.marker-source',
  'connection': '.connection',
  // 'Target Node1':'.joint-type-vg-targeting:nth-child(2) .Targeting__title',
  'TABLET Targeting': 'g[data-pseudo-id="TARGETING-TABLET"] .Targeting__title',
  'DESKTOP Targeting': 'g[data-pseudo-id="TARGETING-DESKTOP"] .Targeting__title',
  'MOBILE Targeting': 'g[data-pseudo-id="TARGETING-MOBILE"] .Targeting__title',

  'Creative in the Graph': '.joint-type-vg-creative',
  'Targeting in the Graph': '.joint-type-vg-targeting',

  'Tracking in the Graph': '.joint-type-vg-tracking',

  'Engagement Card in the Graph': '.joint-type-vg-engagement',


  'Creative_more_Icon': '.Creative__moreIcon',


  'Imagepic': '#imageInputButton',
  'Zipcodes': '.style__fileInput___2zqIQ',


  'LineItem More Icon': '.LineItem__moreIcon',

  'LineItem controlscover': '.LineItem__controlsCover',

  'LineItem deleteIcon': '.LineItem__deleteIcon',

  'LineItem editIcon': '.LineItem__editIcon',

  'Creative1 Default Title': 'g[data-pseudo-id="CREATIVE-Creative 1"]',
  'Creative2 Default Title': 'g[data-pseudo-id="CREATIVE-Creative 2"]',

  'Engagement Default Title': 'g[data-pseudo-id="ENGAGEMENT_CARD-Engagement 1"]',

  'Engagement Card 1': 'g[data-pseudo-id="ENGAGEMENT_CARD-Engagement 1"]',

  'Engagement Card 2': 'g[data-pseudo-id="ENGAGEMENT_CARD-Engagement 2"]',

  'Creative2 MoreIcon': 'g[data-pseudo-id="CREATIVE-Creative 2"] .Creative__moreIcon',

  'TABLET': 'g[data-pseudo-id="TARGETING-TABLET"]',
  'DESKTOP': 'g[data-pseudo-id="TARGETING-DESKTOP"]',
  'MOBILE': 'g[data-pseudo-id="TARGETING-MOBILE"]',

  'Creative Title': '.joint-type-vg-creative',

  'Targeting Title': '.joint-type-vg-targeting',

  '2nd Creative Title': 'g[data-pseudo-id="CREATIVE-Ha_MultipleCreative2"] .joint-type-vg-creative',


  'Creative Edit Container': '.Creative__editIconContainer',


  'Activate message pop-up': '.confirmDialog__labelContainer___3KOu9',
  'Publish button in activate campaign pop-up': '.confirmDialog__confirmButton___m7pKa',
  'Cancel Button in activate campaign pop-up': '.confirmDialog__cancelButton___2bzaK',

  'Delete Confirmation Popup': '.confirmDialog__labelContainer___3KOu9',
  'Delete Button in Delete pop-up': '.confirmDialog__confirmButton___m7pKa.confirmDialog__button___2ttoi',
  'Cancel Button in Delete pop-up': '.confirmDialog__cancelButton___2bzaK.confirmDialog__button___2ttoi',

  // delivery
  'Delivery Connected Elements List': '.style__connectedContainer___2-GqT [data-pseudo-id]>span',
  'Delivery Disconnected Elements List': '.style__disconnectedContainer___3DyuS [data-pseudo-id]>span',

  'calendar': '.bootstrap-datetimepicker-widget',

  'Start Date': '.form__col___3CJjJ .form__flexRowOuter___XpiU4 >div:nth-child(1) .form__col___3CJjJ >div >div >div >input',
  'End Date': '.form__col___3CJjJ .form__flexRowOuter___XpiU4 >div:nth-child(2) .form__col___3CJjJ:nth-child(2) .form__col___3CJjJ >div >div >div >input',
  'Calender Timezone': '.form__flexRowOuter___XpiU4:nth-child(1) .form__col___3CJjJ .form__flexRowOuter___XpiU4 >div:nth-child(3) .form__col___3CJjJ:nth-child(2) .Select-placeholder',
  'Edit Calender Timezone Value': '.form__flexRowOuter___XpiU4:nth-child(1) .form__col___3CJjJ .form__flexRowOuter___XpiU4 >div:nth-child(3) .form__col___3CJjJ:nth-child(2) .Select-value',
  'Calender Timezone Value': '.Select-menu-outer .Select-option[id$="--option-0"]',

  'clear date selection': '.fa-trash-alt',
  'close calendar button': '.fa-times',
  'delivery button': '.fa-clock-o',
  'delivery loading message': '_loading-overlay-transition-leave-active',
  'CampaignGroup loading message' :'.style__label___1kqC3',
  'delivery name': '[name*="name"]',
  'end date error message': 'div:nth-child(2) > div:nth-child(2) .validation__error___jw1Ll:nth-child(2)', // TODO: Better selector
  'end date input': '[name*="endDate"]',
  'go to today': '.fa-crosshairs',
  'select time picker': '.fa-clock',
  'start date input': '[name*="startDate"]',
  'Targeting Name': '[name*="name"]',


  // delivery timePicker
  'close timepicker': '[title="Close the picker"]',
  'timepicker hour': '.timepicker-hour',
  'timepicker minute': '.timepicker-minute',
  'decrement hour button': '[title="Decrement Hour"]',
  'decrement minute button': '[title="Decrement Minute"]',
  'increment hour button': '[title="Increment Hour"]',
  'increment minute button': '[title="Increment Minute"]',

  'Toggle AM/PM': '[title="Toggle Period"]',
  // selecting hours / minutes uses regex: /^(hour|minute) (\d+)$/


  'LineItem_WhenNoCampaignExpanded_Goal_Pacing Section': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ:nth-child(1) .form__flexRow___3cThm:nth-child(1) .style__container___1aGsb',
  'LineItem_WhenNoCampaignExpanded_AC Section': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ:nth-child(1) .form__flexRow___3cThm:nth-child(2) .style__container___1aGsb',
  'LineItem_WhenNoCampaignExpanded_Inventory Section': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ:nth-child(2) .form__flexRow___3cThm:nth-child(1) .style__container___1aGsb',
  'LineItem_WhenNoCampaignExpanded_Delivery Name': '.form__flexRowOuter___XpiU4:nth-child(1) .input__container___2PpZi >input',
  'LineItem_WhenNoCampaignExpanded_Checkbox': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(1) label[for*="goal_pacing"]',
  'LineItem_WhenNoCampaignExpanded_GP Type dropdown': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(1) .Select .Select-value',
  'LineItem_WhenNoCampaignExpanded_Additional Constraints Checkbox': '.form__col___3CJjJ .form__flexRow___3cThm:nth-child(2) label[for*="add_constraints"]',


  'Campaign Delivery Name': '.form__flexRowOuter___XpiU4:nth-child(1) .input__container___2PpZi >input',
  'campaign_Goal_Pacing Checkbox': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(1) Input[id="goal_pacing"]',
  'Creative Delivery Name': '.style__deliveryList___1hdQd:nth-child(2) >li >ul .input__container___2PpZi >input',

  'Delivery_Creative_Banner': '.style__deliveryList___1hdQd:nth-child(2) >li >ul .style__label___2bKHE',
  'Campaign Goal_Pacing Section': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ:nth-child(1) .form__flexRow___3cThm:nth-child(1) .style__container___1aGsb',

  'Goal_Pacing Checkbox': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(1) label[for*="goal_pacing"]',
  'Creative Goal_Pacing Checkbox': '.style__deliveryList___1hdQd:nth-child(2) >li >ul label[for*="goal_pacing"]',


  'Campaign Inventory Checkbox': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ:nth-child(2) label[for*="inventory"]',

  'Creative Inventory Checkbox': '.style__deliveryList___1hdQd:nth-child(2) .form__col___3CJjJ:nth-child(2) label[for*="inventory"]',


  'Edit GP Type dropdown': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(1) .Select .Select-placeholder',

  'AC Period dropdown': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(2) .style__col___ak4o1:nth-child(1) .Select .Select-value',
  'Creative AC Period dropdown': '.style__deliveryList___1hdQd:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(2) .style__col___ak4o1:nth-child(1) .Select .Select-value',

  'AC Type dropdown': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(2) .style__col___ak4o1:nth-child(2) .Select .Select-value',
  'Creative AC Type dropdown': '.style__deliveryList___1hdQd:nth-child(2) >li >ul  .form__col___3CJjJ .form__flexRow___3cThm:nth-child(2) .style__col___ak4o1:nth-child(2) .Select .Select-value',

  'GP Type dropdown': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .form__flexRow___3cThm:nth-child(1) .Select .Select-value',
  'Creative GP Type dropdown': '.style__deliveryList___1hdQd:nth-child(2) >li >ul  .form__col___3CJjJ .form__flexRow___3cThm:nth-child(1) .Select .Select-value',

  'Impressions': '.Select-menu-outer .Select-option[id$="--option-0"]',
  'Starts': '.Select-menu-outer .Select-option[id$="--option-1"]',
  'Views': '.Select-menu-outer .Select-option[id$="--option-2"]',
  'Clicks': '.Select-menu-outer .Select-option[id$="--option-3"]',
  'Inventory Spend': '.Select-menu-outer .Select-option[id$="--option-4"]',
  'Advertiser Cost': '.Select-menu-outer .Select-option[id$="--option-5"]',

  'Daily': '.Select-menu-outer .Select-option[id$="--option-0"]',
  'Monthly': '.Select-menu-outer .Select-option[id$="--option-1"]',
  'Weekly': '.Select-menu-outer .Select-option[id$="--option-2"]',

  'Line Item Pause button': 'div[data-pseudo-id="DELIVERY-Line Item 1"] span.fa-pause-circle',

  'Inv_Vendor0_SuperSonic': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ:nth-child(2) Label[for*="inventory_0"]',
  'Inv_Vendor1_AppNexus': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ:nth-child(2) Label[for*="inventory_1"]',
  'Creative Inv_Vendor1_AppNexus': '.style__deliveryList___1hdQd:nth-child(2)  .form__col___3CJjJ:nth-child(2) Label[for*="inventory_1"]',

  'Inv_Vendor2_RMedia': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ:nth-child(2) Label[for*="inventory_2"]',

  'INDIVIDUALLY': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ:nth-child(2) Label[for*="INDIVIDUALLY"]',

  'Creative INDIVIDUALLY': '.style__deliveryList___1hdQd:nth-child(2)  .form__col___3CJjJ:nth-child(2) Label[for*="INDIVIDUALLY"]',

  'Ind_Vend0_Min': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .style__inventoryCheckbox___2sk6Y:nth-child(1) .style__flexRow___2o4Xh >div:nth-child(1) input[type="text"]',
  'Ind_Vend0_Max': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .style__inventoryCheckbox___2sk6Y:nth-child(1) .style__maxBudgetStyle___3nHnu input[type="text"]',

  'Ind_section': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ:nth-child(2) .style__container___1aGsb',

  'Ind_Vend1_Min': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .style__inventoryCheckbox___2sk6Y:nth-child(2) .style__flexRow___2o4Xh >div:nth-child(1) input[type="text"]',

  'Creative Ind_Vend1_Min': '.style__deliveryList___1hdQd:nth-child(2)  .form__col___3CJjJ .style__inventoryCheckbox___2sk6Y:nth-child(2) .style__flexRow___2o4Xh >div:nth-child(1) input[type="text"]',

  'Creative Ind_Vend1_Max': '.style__deliveryList___1hdQd:nth-child(2)  .form__col___3CJjJ .style__inventoryCheckbox___2sk6Y:nth-child(2) .style__maxBudgetStyle___3nHnu input[type="text"]',

  'Ind_Vend1_Max': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .style__inventoryCheckbox___2sk6Y:nth-child(2) .style__maxBudgetStyle___3nHnu input[type="text"]',

  'Ind_Vend2_Min': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .style__inventoryCheckbox___2sk6Y:nth-child(3) .style__flexRow___2o4Xh >div:nth-child(1) input[type="text"]',
  'Ind_Vend2_Max': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .style__inventoryCheckbox___2sk6Y:nth-child(3) .style__maxBudgetStyle___3nHnu input[type="text"]',

  'OVERALL': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ:nth-child(2) Label[for*="OVERALL"]',
  'Creative Inventory Overall': '.style__deliveryList___1hdQd:nth-child(2)  .form__col___3CJjJ:nth-child(2) Label[for*="OVERALL"]',

  'Inv_Individually_Vendor0_MinMaxSection': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ:nth-child(2) .style__inventoryCheckbox___2sk6Y:nth-child(1)',
  'Inv_Individually_Vendor1_MinMaxSection': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ:nth-child(2) .style__inventoryCheckbox___2sk6Y:nth-child(2)',
  'Inv_Individually_Vendor2_MinMaxSection': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ:nth-child(2) .style__inventoryCheckbox___2sk6Y:nth-child(3)',

  'Inv_Overall_MinMaxSection': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ .style__inventoryOverallContainer___1H_eH',
  'Inv_Vendor0_SuperSonic_MinMaxSection': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ:nth-child(1) .style__inventoryCheckbox___2sk6Y:nth-child(1) .style__flexRow___2o4Xh',
  'Inv_Vendor1_AppNexus_MinMaxSection': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ:nth-child(1) .style__inventoryCheckbox___2sk6Y:nth-child(2) .style__flexRow___2o4Xh',
  'Inv_Vendor2_RMedia_MinMaxSection': '.form__flexRowOuter___XpiU4:nth-child(2) .form__col___3CJjJ:nth-child(1) .style__inventoryCheckbox___2sk6Y:nth-child(3) .style__flexRow___2o4Xh',

  'Vast XML Text': 'div[class="header"] >span',
};

const campaignCanvasCreative = {
  'Creative__editIcon': '.Creative__editIcon',
  'Creative__previewIcon': '.Creative__previewIcon',
  'Creative2 EditIcon': 'g[data-pseudo-id="CREATIVE-Creative 2"] .Creative__editIcon',
  'Creative__controlsCover': '.Creative__controlsCover',

  'Creative2 controlsCover': 'g[data-pseudo-id="CREATIVE-Creative 2"] .Creative__controlsCover',
  'Creative__deleteIcon': '.Creative__deleteIcon',
  'Creative__statIcon': '.Creative__statIcon',

  'Creative Preview Video': '.style__videoContainer___aLhGy',

  'VPAID Checkbox': '#vpaidLabel',
  'Vast Tag Inputfield': '[name="vastTag"]',

};

const CreativeSocialShare = {
  'Background Color Icon': '.style__colorPickerWrapper___2MkzP > div:nth-child(1) .style__colorPicker___1J739',
  'Close Background Color Picker': '.style__colorPickerWrapper___2MkzP > div:nth-child(1)',
  'Symbol Color Icon': '.style__colorPickerWrapper___2MkzP > div:nth-child(2) .style__colorPicker___1J739',
  'Close Symbol Color Picker': '.style__colorPickerWrapper___2MkzP > div:nth-child(2)',

  'Copy And Paste Share Url Checkbox': '#COPY_AND_PASTE_SHARE_URL',
  'Copy And Paste Share Url Icon': '#COPY_AND_PASTE_SHARE_URL-label',
  'Copy And Paste Share Url Symbol': '.fa-link',
  'Email Checkbox': '#EMAIL',
  'Email Icon': '#EMAIL-label',
  'Email Symbol': '.fa-envelope',
  'Facebook Icon': '#FACEBOOK-label',
  'Facebook Symbol': '.fa-facebook-f',
  'Facebook Checkbox': '#FACEBOOK',
  'LinkedIn Checkbox': '#LINKEDIN',
  'LinkedIn Icon': '#LINKEDIN-label',
  'LinkedIn Symbol': '.fa-linkedin-in',
  'Pinterest Checkbox': '#PINTEREST',
  'Pinterest Icon': '#PINTEREST-label',
  'Pinterest Symbol': '.fa-pinterest',
  'SMS Checkbox': '#SMS',
  'SMS Icon': '#SMS-label',
  'SMS Symbol': '.fa-comment',
  'Twitter Checkbox': '#TWITTER',
  'Twitter Icon': '#TWITTER-label',
  'Twitter Symbol': '.fa-twitter',

  'Social Share Browser Label': '[name="socialShare.browserLabel"]',

  'Social Share Checkbox': '#socialSharing',
  'Social Share Description Counter': '.style__field___75DOH:nth-child(2) .style__counter___5JOye',
  'Social Share Description Input': '.style__field___75DOH:nth-child(2) input',
  'Social Share Header Counter': '.style__field___75DOH .style__counter___5JOye',
  'Social Share Header Input': '.style__field___75DOH:nth-child(1) input',

  'Social Share Options Dropdown': '.style__boxContainer___vMsTX:nth-child(3) .Select-control',
  'Social Share Thumbnail Preview': '.style__preview___53wZb',
  'Social Share Thumbnail Upload': '#imageInputButton'
};

const campaignCanvasEngagementCard = {
  'Engagement Card_moreIcon': '.EngagementCard__moreIcon',

  'Engagement Card Name': '[name*="name"]',
  'Engagement Card editIcon': '.EngagementCard__editIcon',
  'Engagement Card Delete Icon': '.EngagementCard__deleteIcon',
  'Engagement Card__controlsCover': '.EngagementCard__controlsCover',
};

const campaignCanvasTargeting = {
  'Targeting__moreIcon': '.Targeting__moreIcon',
  'Targeting__editIcon': '.Targeting__editIcon',

  'Targeting__controlsCover': '.Targeting__controlsCover',
  'Targeting__deleteIcon': '.Targeting__deleteIcon',

  'Targeting Type Dropdown': '.form__col___3CJjJ .form__flexRowOuter___XpiU4 .form__col___3CJjJ:nth-child(1) .Select-value',

  'Targeting Type Value-AdId': '.Select-menu-outer .Select-option[id$="--option-0"]',
  'Targeting Type Value-Country': '.Select-menu-outer .Select-option[id$="--option-1"]',
  'Targeting Type Value-DayParting': '.Select-menu-outer .Select-option[id$="--option-2"]',
  'Targeting Type Value-Device': '.Select-menu-outer .Select-option[id$="--option-3"]',
  'Targeting Type Value-DMA': '.Select-menu-outer .Select-option[id$="--option-4"]',
  'Targeting Type Value-Environment': '.Select-menu-outer .Select-option[id$="--option-5"]',
  'Targeting Type Value-Inventory Size': '.Select-menu-outer .Select-option[id$="--option-6"]',
  'Targeting Type Value-OperatingSystem': '.Select-menu-outer .Select-option[id$="--option-7"]',
  'Targeting Type Value-Placement Type': '.Select-menu-outer .Select-option[id$="--option-8"]',
  'Targeting Type Value-Radius': '.Select-menu-outer .Select-option[id$="--option-9"]',
  'Targeting Type Value-Site List': '.Select-menu-outer .Select-option[id$="--option-10"]',
  'Targeting Type Value-User Initiation': '.Select-menu-outer .Select-option[id$="--option-11"]',
  'Targeting Type Value-Video Aspect Ratio': '.Select-menu-outer .Select-option[id$="--option-12"]',
  'Targeting Type Value-Zipcode': '.Select-menu-outer .Select-option[id$="--option-13"]',


  'Download File Icon': '.fa-download',
  'Site URL field': '.form__flexRow___3cThm .form__col___3CJjJ:nth-child(3) input',
  'Site URL Menu': '.Select-menu-outer .Select-option[id$="--option-0"]',
  'Min Width': '.form__col___3CJjJ:nth-child(2) .form__flexRow___3cThm >div:nth-child(2) >div >input',
  'Min Height': '.form__col___3CJjJ:nth-child(2) .form__flexRow___3cThm >div:nth-child(4) >div >input',

  'Radius Address': '.form__col___3CJjJ:nth-child(3) .style__fieldContainer___BCxFl >input',
  'Radius Miles': '.form__col___3CJjJ:nth-child(3)  .style__container___2ds2G>input',

  'Include_Exclude dropdown': '.form__col___3CJjJ .form__flexRowOuter___XpiU4 .form__col___3CJjJ:nth-child(2) .Select-value',
  'Include_Exclude Value-Include': '.Select-menu-outer .Select-option[id$="--option-0"]',
  'Include_Exclude Value-Exclude': '.Select-menu-outer .Select-option[id$="--option-1"]',

  'Excluded Targetings': '[data-targetingtype="EXCLUDE"] .style__parameterDisplayValue___3rJmb',
  'Included Targetings': '[data-targetingtype="INCLUDE"] .style__parameterDisplayValue___3rJmb',
  'Add Targeting Criteria Button': '.style__addButton___2Ia7l',

  // Zipcode
  'Add Targeting button': '.style__addButton___2Ia7l',
  'Browse link': '.style__fileInput___2zqIQ',
  'Targeting file to select Field': '.style__fileDisplay___16AoL.style__flexCol___1wcWo',
  'Targeting file uploaded message': '.style__messageLabel___34Q9t',
  'File uploaded display value section': '.style__parameterDisplayValue___3rJmb',
  'File uploaded category value section': '.style__parameterDisplayCategory____oxao',
  'File upload display section close button': '.style__removeButton___2Z_g2',
  'File uploaded category Label section': '.style__targetingCategoryLabel___3LuDL',
  'Remove button on file': '.style__targetingParametersBox___38uty .fa-close',

  // User Initiation
  'Auto Play Muted Checkbox Status': '[id="Auto Play Muted"]',
  'Update Auto Play Muted Checkbox': '[id="Auto Play Muted-label"]',
  'Auto Play Unmuted Checkbox Status': '[id="Auto Play Unmuted"]',
  'Update Auto Play Unmuted Checkbox': '[id="Auto Play Unmuted-label"]',
  'Click to Play Checkbox Status': '[id="Click to Play"]',
  'Update Click to Play Checkbox': '[id="Click to Play-label"]',
  // nth(1) is checkbox, nth(2) is label. Need to click on the label as the checkbox is not visible

  // Devices
  'Desktop Checkbox Status': '[id="Desktop"]',
  'Update Desktop Checkbox': '[id="Desktop-label"]',
  'Mobile Checkbox Status': '[id="Mobile"]',
  'Update Mobile Checkbox': '[id="Mobile-label"]',
  'Tablet Checkbox Status': '[id="Tablet"]',
  'Update Tablet Checkbox': '[id="Tablet-label"]',

  // Environment
  'Web Checkbox Status': '[id="Web"]',
  'Update Web Checkbox': '[id="Web-label"]',
  'App Checkbox Status': '[id="App"]',
  'Update App Checkbox': '[id="App-label"]',

  // Video Aspect Ratio
  'Horizontal Checkbox Status': '[id="Horizontal"]',
  'Update Horizontal Checkbox': '[id="Horizontal-label"]',
  'Vertical Checkbox Status': '[id="Vertical"]',
  'Update Vertical Checkbox': '[id="Vertical-label"]',

  // Placement Type
  'Out-Stream Checkbox Status': '[id="Out-Stream"]',
  'Update Out-Stream Checkbox': '[id="Out-Stream-label"]',
  'In-Stream Checkbox Status': '[id="In-Stream"]',
  'Update In-Stream Checkbox': '[id="In-Stream-label"]',
  'MRAID Interstitial (Video) Checkbox Status': '[id="MRAID Interstitial (Video)"]',
  'Update MRAID Interstitial (Video) Checkbox': '[id="MRAID Interstitial (Video)-label"]',
  'Other Placement Checkbox Status': '[id="Other Placement"]',
  'Update Other Placement Checkbox': '[id="Other Placement-label"]',

  // Site List
  'Delete First Site': '.Select-value-icon',
  'Second Targeting Site': '.Select-create-option-placeholder:nth-child(2)',
  'Site List Inputfield': '.Select-input input',

  'Site List Error Message': '.style__validationMessage___2fWRs',


  'Targeting pop-up Cancel button': '.style__cancelButton___1qlOj',
};

const campaignCanvasTargetingDayParting = {
  'Add More Time Ranges': '.fa-plus-circle',
  'Remove Time Range': '.fa-times',

  'First Day Parting End Input': '[name="timeRanges[0].endTime"]',
  'First Day Parting Start Input': '[name="timeRanges[0].startTime"]',
  'Second Day Parting End Input': '[name="timeRanges[1].endTime"]',
  'Second Day Parting Start Input': '[name="timeRanges[1].startTime"]',


  'Day Options': '.style__selector___a1QlE',

  'Sunday': '#Sunday-label',
  'Sunday Checkbox': '#Sunday',
  'Monday': '#Monday-label',
  'Monday Checkbox': '#Monday',
  'Tuesday': '#Tuesday-label',
  'Tuesday Checkbox': '#Tuesday',
  'Wednesday': '#Wednesday-label',
  'Wednesday Checkbox': '#Wednesday',
  'Thursday': '#Thursday-label',
  'Thursday Checkbox': '#Thursday',
  'Friday': '#Friday-label',
  'Friday Checkbox': '#Friday',
  'Saturday': '#Saturday-label',
  'Saturday Checkbox': '#Saturday'
};

const campaignHeaderButtons = {
  'Activate campaign': '.bar__rightIcons___2hGIf >button:nth-child(1)',
  'Canvas Button': '.bar__right___1J10-',
  'Panel Button': '.bar__left___3gJCb'
};

const campaignPanelSelectors = {
  'Campaign Panel Dropdown' : '.Select-control',
  'Campaign Panel Creative and Creative Group Names' : '.style__bodyItem___1u-JZ:nth-child(1)',
  'Campaign Overview Campaign Name' : ' li:nth-child(1)',
  'Campaign Overview Status' : ' li:nth-child(2)',
  'Campaign Overview # of Creative Groups' : ' li:nth-child(3)',
  'Campaign Overview # of Creatives' : ' li:nth-child(4)'
};


export function getCampaignCanvasSelector(key) {
  if (key in campaignCanvas) {
    return campaignCanvas[key];
  }
  if (key in campaignCanvasCreative) {
    return campaignCanvasCreative[key];
  }
  if (key in campaignCanvasEngagementCard) {
    return campaignCanvasEngagementCard[key];
  }
  if (key in campaignCanvasTargeting) {
    return campaignCanvasTargeting[key];
  }
  if (key in CreativeSocialShare) {
    return CreativeSocialShare[key];
  }
  if (key in campaignCanvasTargetingDayParting) {
    return campaignCanvasTargetingDayParting[key];
  }
  if (key in campaignHeaderButtons) {
    return campaignHeaderButtons[key];
  }
  if (key in campaignPanelSelectors) {
    return campaignPanelSelectors[key];
  }

  return null;
}
