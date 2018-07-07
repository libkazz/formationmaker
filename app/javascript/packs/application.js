/* eslint no-console:0 */
'use strict'
import '../src/application.sass'
import html2canvas from 'html2canvas'

import Rails from 'rails-ujs'
Rails.start()

global.Rails = Rails
global.ImageUpdate = function(dom){
  dom.querySelectorAll('a.action').forEach(a => { a.classList.add('hide') })

  html2canvas(dom, {width: 620, height: 510}).then(canvas => {
    dom.querySelectorAll('a.action').forEach(a => { a.classList.remove('hide') })

    let form = document.getElementById('update_image_cache_form');
    form.elements['team[image_cache]'].value = canvas.toDataURL(0.5);

    let data = Rails.serializeElement(form);
    Rails.ajax({
      type: 'POST',
      url: document.location.href,
      data: data,
      dataType: 'json'
    })
  });
}
