<template>
     <div id="roulette-container">
  <div class="circle1">
  </div>
  <div class="circle2">
  </div>
  <div class="circle3">
  </div>
</div>
</template>

<script>

export default {
  data() {
    return {
      options: ['Try Again'],
      new_option: '',
      startAngle: 0,
      spinAngleStart: 0,
      spinTimeout: null,
      spinArcStart: 10,
      spinTime: 0,
      spinTimeTotal: 0,
      ctx: ''
    };
  },

  computed: {
    arc() {
      return Math.PI / (this.options.length / 2);
    }
  },

  methods: {
    byte2Hex(n) {
      const nybHexString = "0123456789ABCDEF";
      return String(nybHexString.substr((n >> 4) & 0x0F,1)) + nybHexString.substr(n & 0x0F,1);
    },

    RGB2Color(r,g,b) {
      return '#' + this.byte2Hex(r) + this.byte2Hex(g) + this.byte2Hex(b);
    },

    getColor(item, maxitem) {
      const phase = 0;
      const center = 128;
      const width = 127;
      const frequency = Math.PI*2/maxitem;
      
      let red   = Math.sin(frequency*item+2+phase) * width + center;
      let green = Math.sin(frequency*item+0+phase) * width + center;
      let blue  = Math.sin(frequency*item+4+phase) * width + center;
      
      return this.RGB2Color(red,green,blue);
    },

    addOptions() {
      this.options.push(this.new_option);
      this.new_option = '';
      this.drawRouletteWheel();
    },
    removeOptions(option) {
      let idx = this.options.indexOf(option) || 0;
      this.options.splice(idx, 1);
      this.drawRouletteWheel();
    },

    drawRouletteWheel() {
      const canvas = document.getElementById("canvas");
      if (canvas.getContext) {
        const outsideRadius = 200;
        const textRadius = 160;
        const insideRadius = 125;

        this.ctx = canvas.getContext("2d");
        this.ctx.clearRect(0, 0, 500, 500);

        this.ctx.strokeStyle = "black";
        this.ctx.lineWidth = 2;

        this.ctx.font = 'bold 12px Helvetica, Arial';

        for (let i = 0; i < this.options.length; i++) {
          const angle = this.startAngle + i * this.arc;

          this.ctx.fillStyle = this.getColor(i, this.options.length);

          this.ctx.beginPath();
          this.ctx.arc(250, 250, outsideRadius, angle, angle + this.arc, false);
          this.ctx.arc(250, 250, insideRadius, angle + this.arc, angle, true);
          this.ctx.stroke();
          this.ctx.fill();

          this.ctx.save();
          this.ctx.shadowOffsetX = -1;
          this.ctx.shadowOffsetY = -1;
          this.ctx.shadowBlur = 0;
          this.ctx.shadowColor = "rgb(220,220,220)";
          this.ctx.fillStyle = "black";
          this.ctx.translate(250 + Math.cos(angle + this.arc / 2) * textRadius,
            250 + Math.sin(angle + this.arc / 2) * textRadius);
          this.ctx.rotate(angle + this.arc / 2 + Math.PI / 2);
          const text = this.options[i];
          this.ctx.fillText(text, -this.ctx.measureText(text).width / 2, 0);
          this.ctx.restore();
        }

        //Arrow
        this.ctx.fillStyle = "black";
        this.ctx.beginPath();
        this.ctx.moveTo(250 - 4, 250 - (outsideRadius + 5));
        this.ctx.lineTo(250 + 4, 250 - (outsideRadius + 5));
        this.ctx.lineTo(250 + 4, 250 - (outsideRadius - 5));
        this.ctx.lineTo(250 + 9, 250 - (outsideRadius - 5));
        this.ctx.lineTo(250 + 0, 250 - (outsideRadius - 13));
        this.ctx.lineTo(250 - 9, 250 - (outsideRadius - 5));
        this.ctx.lineTo(250 - 4, 250 - (outsideRadius - 5));
        this.ctx.lineTo(250 - 4, 250 - (outsideRadius + 5));
        this.ctx.fill();
      }
    },

    spin() {
      this.spinAngleStart = Math.random() * 10 + 10;
      this.spinTime = 0;
      this.spinTimeTotal = Math.random() * 3 + 4 * 1000;
      this.rotateWheel();
    },

    rotateWheel() {
      this.spinTime += 30;
      if (this.spinTime >= this.spinTimeTotal) {
        this.stopRotateWheel();
        return;
      }
      const spinAngle = this.spinAngleStart - this.easeOut(this.spinTime, 0, this.spinAngleStart, this.spinTimeTotal);
      this.startAngle += (spinAngle * Math.PI / 180);
      this.drawRouletteWheel();

      const _this = this;
      this.spinTimeout = setTimeout(function() {
        _this.rotateWheel();
      }, 30);
    },

    stopRotateWheel() {
      clearTimeout(this.spinTimeout);
      const degrees = this.startAngle * 180 / Math.PI + 90;
      const arcd = this.arc * 180 / Math.PI;
      const index = Math.floor((360 - degrees % 360) / arcd);
      this.ctx.save();
      this.ctx.font = 'bold 30px Helvetica, Arial';
      const text = this.options[index];
      console.log(index, text, this.options);
      this.ctx.fillText(text, 250 - this.ctx.measureText(text).width / 2, 250 + 10);
      this.ctx.restore();
    },
    easeOut(t, b, c, d) {
      const ts = (t /= d) * t;
      const tc = ts * t;
      return b + c * (tc + -3 * ts + 3 * t);
    }
  },
  mounted() {
    this.drawRouletteWheel();
  }
};
</script>

<style>
#roulette-container {
  position: absolute;
  left: 45%;
  height: 120px;
  width: 120px;
  border-radius: 50%;
  background: #272727;
}
.circle1 {
  position: relative;
  top: 0px;
  width: 0px;
  height: 0px;
  border-right: 60px solid transparent;
  border-top: 60px solid #1ba7f2;
  border-left: 60px solid transparent;
  border-bottom: 60px solid transparent;
  border-top-left-radius: 60px;
  border-top-right-radius: 60px;
  -moz-transform:rotate(320deg);
  -webkit-transform:rotate(320deg);
  -o-transform:rotate(320deg);
  -ms-transform:rotate(320deg);
  animation: spin1 0.5s infinite linear;
  -webkit-animation: spin1 0.5s infinite linear;
  
}
.circle2 {
  position: absolute;
  top: 0px;
  width: 0px;
  height: 0px;
  border-right: 60px solid transparent;
  border-top: 60px solid #1ba7f2;
  border-left: 60px solid transparent;
  border-bottom: 60px solid transparent;
  border-top-left-radius: 60px;
  border-top-right-radius: 60px;
  -moz-transform:rotate(80deg);
  -webkit-transform:rotate(80deg);
  -o-transform:rotate(80deg);
  -ms-transform:rotate(80deg);
  animation: spin2 0.5s infinite linear;
  -webkit-animation: spin2 0.5s infinite linear;
}
.circle3 {
  position: absolute;
  top: 0px;
  width: 0px;
  height: 0px;
  border-right: 60px solid transparent;
  border-top: 60px solid #1ba7f2;
  border-left: 60px solid transparent;
  border-bottom: 60px solid transparent;
  border-top-left-radius: 60px;
  border-top-right-radius: 60px;
  -moz-transform:rotate(200deg);
  -webkit-transform:rotate(200deg);
  -o-transform:rotate(200deg);
  -ms-transform:rotate(200deg);
  animation: spin3 0.5s infinite linear;
  -webkit-animation: spin3 0.5s infinite linear;
}

@keyframes spin1 {
  0% {
  -moz-transform:rotate(320deg);
  -webkit-transform:rotate(320deg);
  -o-transform:rotate(320deg);
  -ms-transform:rotate(320deg);
  }
  100% {
  -moz-transform:rotate(680deg);
  -webkit-transform:rotate(680deg);
  -o-transform:rotate(680deg);
  -ms-transform:rotate(680deg); 
  }
}
@-webkit-keyframes spin1 {
  0% {
  -moz-transform:rotate(320deg);
  -webkit-transform:rotate(320deg);
  -o-transform:rotate(320deg);
  -ms-transform:rotate(320deg);
  }
  100% {
  -moz-transform:rotate(680deg);
  -webkit-transform:rotate(680deg);
  -o-transform:rotate(680deg);
  -ms-transform:rotate(680deg); 
  }
}
@keyframes spin2 {
  0% {
  -moz-transform:rotate(80deg);
  -webkit-transform:rotate(80deg);
  -o-transform:rotate(80deg);
  -ms-transform:rotate(80deg);
  }
  100% {
  -moz-transform:rotate(440deg);
  -webkit-transform:rotate(440deg);
  -o-transform:rotate(440deg);
  -ms-transform:rotate(440deg); 
  }
}
@-webkit-keyframes spin2 {
  0% {
  -moz-transform:rotate(80deg);
  -webkit-transform:rotate(80deg);
  -o-transform:rotate(80deg);
  -ms-transform:rotate(80deg);
  }
  100% {
  -moz-transform:rotate(440deg);
  -webkit-transform:rotate(440deg);
  -o-transform:rotate(440deg);
  -ms-transform:rotate(440deg); 
  }
}
@keyframes spin3 {
  0% {
  -moz-transform:rotate(200deg);
  -webkit-transform:rotate(200deg);
  -o-transform:rotate(200deg);
  -ms-transform:rotate(200deg);
  }
  100% {
  -moz-transform:rotate(560deg);
  -webkit-transform:rotate(560deg);
  -o-transform:rotate(560deg);
  -ms-transform:rotate(560deg); 
  }
}
@-webkit-keyframes spin3 {
  0% {
  -moz-transform:rotate(200deg);
  -webkit-transform:rotate(200deg);
  -o-transform:rotate(200deg);
  -ms-transform:rotate(200deg);
  }
  100% {
  -moz-transform:rotate(560deg);
  -webkit-transform:rotate(560deg);
  -o-transform:rotate(560deg);
  -ms-transform:rotate(560deg); 
  }
}
</style>