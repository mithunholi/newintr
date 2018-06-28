<%String totrecs = request.getAttribute("tot1").toString();
String totrecs1 = request.getAttribute("tot2").toString();
System.out.println("oop====="+totrecs1);%>
<script>document.title = 'Dashboard';</script>
<div class="row" style="margin-bottom:50"></div>
<div class="row" style="padding:10px">
<div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box bg-aqua">
            <span class="info-box-icon"><i style="padding-top:15px" class="fa fa-wheelchair"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">No.of Patients</span>
              <span class="info-box-number"><%=totrecs %></span>

              <div class="progress">
                <div class="progress-bar" style="width: 70%"></div>
              </div>
                  <span class="progress-description">
                    70% Increase in 30 Days
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        
        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box bg-green">
            <span class="info-box-icon"><i style="padding-top:15px" class="fa fa-user-md"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">No.of Doctors</span>
              <span class="info-box-number">1</span>

              <div class="progress">
                <div class="progress-bar" style="width: 20%"></div>
              </div>
                  <span class="progress-description">
                    20% Increase in 30 Days
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        
        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box bg-yellow">
            <span class="info-box-icon"><i style="padding-top:15px" class="fa fa-stack-exchange"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Total no.of Records</span>
              <span class="info-box-number"><%=totrecs1%></span>

   
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        </div>