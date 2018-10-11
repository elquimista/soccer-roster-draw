import { Controller } from 'stimulus';
import moment from 'moment-timezone';

const userTZ = moment.tz.guess();

export default class extends Controller {
  static targets = ['tzAwareDateTime'];

  connect() {
    this.tzAwareDateTimeTargets.forEach(el => {
      el.innerText = moment(el.dataset.value).tz(userTZ).format('D MMMM YYYY, HH:mm Z');
    })
  }
}
