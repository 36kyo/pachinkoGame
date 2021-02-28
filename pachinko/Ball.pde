class Ball{
    float x = 0;
    float y = 0;
    float r = 10;
    float vx = 0;
    float vy = 0;
    float g = 0;
    
    boolean isCollisionEnabled = true;
    boolean isCollided = false;
    float refXMin = 0;
    float refXMax = width;
    float refYMin = 0;
    float refYMax = height;
    
    color fillColor = color(255);
    color lineColor = color(0);

    Ball(float x, float y, float r){
        this.x = x;
        this.y = y;
        this.r = r;
        this.g = 0;
        
    }
    void setVelocity(float vx, float vy){
        this.vx = vx;
        this.vy = vy;
    }
    void setFillColor(color c){
        this.fillColor = c;
    }
    void setLineColor(color c){
        this.lineColor = c;
    }
    void setGravity(float g){
        this.g = g;
    }
    void update(){
        this.vy += this.g;
        this.x += this.vx;
        this.y += this.vy;
        
        if(this.x >= this.refXMax - this.r){
            this.x = this.refXMax - this.r;
            this.vx *= -1;
        }else if(this.x <= this.refXMin + this.r){
            this.x = this.refXMin + this.r;
            this.vx *= -1;
        }
        
        if(this.y >= this.refYMax - this.r){
            this.y = this.refYMax - this.r;
            this.vy *= -1;
        }else if(this.y <= this.refYMin + this.r){
            this.y = this.refYMin + this.r;
            this.vy *= -1;
        }
        //this.isCollided = false;
        //if(this.x >= this.refXMax - this.r){
        //    this.x = this.refXMax - this.r;
        //    this.vx *= -1;
        //    this.isCollided = true;
        //}else if(this.x <= this.refXMin + this.r){
        //    this.x = this.refXMin + this.r;
        //    this.vx *= -1;
        //    this.isCollided = true;
        //}
        
        //if(this.y >= this.refYMax - this.r){
        //    this.y = this.refYMax - this.r;
        //    this.vy *= -1;
        //    this.isCollided = true;
        //}else if(this.y <= this.refYMin + this.r){
        //    this.y = this.refYMin + this.r;
        //    this.vy *= -1;
        //    this.isCollided = true;
        //}
        //if(!this.isCollided){
        //}
        
        //this.vy += this.g;
        //this.x += this.vx;
        //this.y += this.vy;
        
        
        
        
    }
    void display(){
        stroke(this.lineColor);
        fill(this.fillColor);
        ellipse(this.x, this.y, this.r, this.r);
    }
}
