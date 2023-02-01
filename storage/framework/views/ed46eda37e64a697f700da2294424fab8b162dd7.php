<?php $__env->startSection('content'); ?>


           <?php


		date_default_timezone_set('Asia/Tehran');


		list($gy, $gm, $gd) = explode('-', date('Y-n-d'));


		$j_date_array = gregorian_to_jalali($gy, $gm, $gd); //خروجی آرایه
		$j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //خروجی رشته




	function gregorian_to_jalali($gy, $gm, $gd, $mod='') {
	  $g_d_m = array(0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334);
	  $gy2 = ($gm > 2)? ($gy + 1) : $gy;
	  $days = 355666 + (365 * $gy) + ((int)(($gy2 + 3) / 4)) - ((int)(($gy2 + 99) / 100)) + ((int)(($gy2 + 399) / 400)) + $gd + $g_d_m[$gm - 1];
	  $jy = -1595 + (33 * ((int)($days / 12053)));
	  $days %= 12053;
	  $jy += 4 * ((int)($days / 1461));
	  $days %= 1461;
	  if ($days > 365) {
		$jy += (int)(($days - 1) / 365);
		$days = ($days - 1) % 365;
	  }
	  if ($days < 186) {
		$jm = 1 + (int)($days / 31);
		$jd = 1 + ($days % 31);
	  } else{
		$jm = 7 + (int)(($days - 186) / 30);
		$jd = 1 + (($days - 186) % 30);
	  }
	  return ($mod == '')? array($jy, $jm, $jd) : $jy.$mod.$jm.$mod.$jd;
	}
?>

<?php if(session()->has('not_permitted')): ?>
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo e(session()->get('not_permitted')); ?></div> 
<?php endif; ?>
<?php if(session()->has('message')): ?>
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo e(session()->get('message')); ?></div> 
<?php endif; ?>
      <div class="row">
        <div class="container-fluid">
          <div class="col-md-12">
            <div class="brand-text float-left mt-4">
                <h3><?php echo e(trans('file.welcome')); ?> <span><?php echo e(Auth::user()->name); ?></span> </h3>
            </div>
            <div class="filter-toggle btn-group"    style=" font-family: 'Shabnam';">
              <button class="btn btn-secondary date-btn" data-start_date="<?php echo e(date('Y-m-d')); ?>" data-end_date="<?php echo e(date('Y-m-d')); ?>"><?php echo e(trans('file.Today')); ?></button>
              <button class="btn btn-secondary date-btn" data-start_date="<?php echo e(date('Y-m-d', strtotime(' -7 day'))); ?>" data-end_date="<?php echo e(date('Y-m-d')); ?>"><?php echo e(trans('file.Last 7 Days')); ?></button>
              <button class="btn btn-secondary date-btn active" data-start_date="<?php echo e(date('Y').'-'.date('m').'-'.'01'); ?>" data-end_date="<?php echo e(date('Y-m-d')); ?>"><?php echo e(trans('file.This Month')); ?></button>
              <button class="btn btn-secondary date-btn" data-start_date="<?php echo e(date('Y').'-01'.'-01'); ?>" data-end_date="<?php echo e(date('Y').'-12'.'-31'); ?>"><?php echo e(trans('file.This Year')); ?></button>
            </div>
          </div>
        </div>
      </div>
      <!-- Counts Section -->
      <section class="dashboard-counts">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12 form-group">
              <div class="row">
                <!-- Count item widget-->
                <div class="col-sm-3">
                  <div class="wrapper count-title text-center">
                    <div class="icon"><i class="dripicons-graph-bar" style="color: #733686"></i></div>
                    <div class="name"><strong style="color: #733686"><?php echo e(trans('file.revenue')); ?></strong></div>
                    <div class="count-number revenue-data">
                    <?php
                        
                              $iran=number_format($revenue, 2);
                                                
                     echo     substr($iran, 0, -3) .config('currency'); 
                    ?>
                    
                    
                    </div>
                  </div>
                </div>
                <!-- Count item widget-->
                <div class="col-sm-3">
                  <div class="wrapper count-title text-center">
                    <div class="icon"><i class="dripicons-return" style="color: #ff8952"></i></div>
                    <div class="name"><strong style="color: #ff8952"><?php echo e(trans('file.Sale Return')); ?></strong></div>
                    <div class="count-number return-data">
                    
                      <?php
                      
                          $iran=number_format($return, 2);
                       
                                                
                     echo     substr($iran, 0, -3)  .config('currency'); 
                    ?>
                    
                    </div>
                  </div>
                </div>
                <!-- Count item widget-->
                <div class="col-sm-3">
                  <div class="wrapper count-title text-center">
                    <div class="icon"><i class="dripicons-media-loop" style="color: #00c689"></i></div>
                    <div class="name"><strong style="color: #00c689"><?php echo e(trans('file.Purchase Return')); ?></strong></div>
                    <div class="count-number purchase_return-data">
                         <?php
                  $iran=number_format($purchase_return, 2);
                     echo     substr($iran, 0, -3) .config('currency'); 
                    ?>

                    </div>
                  </div>
                </div>
                <!-- Count item widget-->
                <div class="col-sm-3">
                  <div class="wrapper count-title text-center">
                    <div class="icon"><i class="dripicons-trophy" style="color: #297ff9"></i></div>
                    <div class="name"><strong style="color: #297ff9"><?php echo e(trans('file.profit')); ?></strong></div>
                    <div class="count-number profit-data">
                    
                    <?php
                      $iran=number_format($profit, 2);
                     echo     substr($iran, 0, -3)  .config('currency'); 
                    ?>
                    
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            
            
            
            <div class="col-md-7 mt-4">
              <div class="card line-chart-example">
                <div class="card-header d-flex align-items-center">
                  <h4><?php echo e(trans('file.Cash Flow')); ?></h4>
                </div>
                <div class="card-body">
                  <?php
                    if($general_setting->theme == 'default.css'){
                      $color = '#733686';
                      $color_rgba = 'rgba(115, 54, 134, 0.8)';
                    }
                    elseif($general_setting->theme == 'green.css'){
                        $color = '#2ecc71';
                        $color_rgba = 'rgba(46, 204, 113, 0.8)';
                    }
                    elseif($general_setting->theme == 'blue.css'){
                        $color = '#3498db';
                        $color_rgba = 'rgba(52, 152, 219, 0.8)';
                    }
                    elseif($general_setting->theme == 'dark.css'){
                        $color = '#34495e';
                        $color_rgba = 'rgba(52, 73, 94, 0.8)';
                    }
                  ?>
                  <canvas id="cashFlow" 
                  data-color = "<?php echo e($color); ?>" 
                  data-color_rgba = "<?php echo e($color_rgba); ?>" data-recieved = "<?php echo e(json_encode($payment_recieved)); ?>" 
                  data-sent = "<?php echo e(json_encode($payment_sent)); ?>"
                  data-month = "<?php echo e(json_encode($month)); ?>" 
                  data-label1="<?php echo e(trans('file.Payment Recieved')); ?>" 
                  data-label2="<?php echo e(trans('file.Payment Sent')); ?>"></canvas>
                </div>
              </div>
            </div>
            
            
            
            
            
            
            
            <div class="col-md-5 mt-4">
              <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                  <h4>نمودار </h4>
                </div>
                <div class="pie-chart mb-2">
                    
                    <canvas id="transactionChart"
                    data-color = "<?php echo e($color); ?>" data-color_rgba = "<?php echo e($color_rgba); ?>" 
                    data-revenue=<?php echo e($revenue); ?> 
                    data-purchase=<?php echo e($purchase); ?>

                    data-expense=<?php echo e($expense); ?>

                    data-label1="<?php echo e(trans('file.Purchase')); ?>" 
                    data-label2="<?php echo e(trans('file.revenue')); ?>"
                    data-label3="<?php echo e(trans('file.Expense')); ?>"
                    width="100" height="95"> </canvas>
                    
                    
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <div class="container-fluid">
          <div class="row">
         
            <div class="col-md-7" style="    font-family: 'Shabnam';">
              <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center" >
                  <h4><?php echo e(trans('file.Recent Transaction')); ?></h4>
                  <div class="right-column">
                    <div class="badge badge-primary"><?php echo e(trans('file.latest')); ?> 5</div>
                  </div>
                </div>
                <ul class="nav nav-tabs" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link active" href="#sale-latest" role="tab" data-toggle="tab"><?php echo e(trans('file.Sale')); ?></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#purchase-latest" role="tab" data-toggle="tab"><?php echo e(trans('file.Purchase')); ?></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#quotation-latest" role="tab" data-toggle="tab"><?php echo e(trans('file.Quotation')); ?></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#payment-latest" role="tab" data-toggle="tab"><?php echo e(trans('file.Payment')); ?></a>
                  </li>
                </ul>

                <div class="tab-content">
                  <div role="tabpanel" class="tab-pane fade show active" id="sale-latest">
                      <div class="table-responsive">
                        <table class="table">
                          <thead>
                            <tr>
                              <th><?php echo e(trans('file.date')); ?></th>
                              <th><?php echo e(trans('file.reference')); ?></th>
                              <th><?php echo e(trans('file.customer')); ?></th>
                              <th><?php echo e(trans('file.status')); ?></th>
                              <th><?php echo e(trans('file.grand total')); ?></th>
                            </tr>
                          </thead>
                          <tbody>
                            <?php $__currentLoopData = $recent_sale; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $sale): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <?php $customer = DB::table('customers')->find($sale->customer_id); ?>
                            <tr>
                              <td>
                                         
                 
                   <?php
                                  
                       
                              
		date_default_timezone_set('Asia/Tehran');


		list($gy, $gm, $gd) = explode('-', ($sale->created_at->toDateString()));


		$j_date_array = gregorian_to_jalali($gy, $gm, $gd); //خروجی آرایه
		$j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //خروجی رشته
		
		
		echo $j_date_string;
?>
                
                              </td>   
                              <td><?php echo e($sale->reference_no); ?></td>
                              <td><?php echo e($customer->name); ?></td>
                              <?php if($sale->sale_status == 1): ?>
                              <td><div class="badge badge-success"><?php echo e(trans('file.Completed')); ?></div></td>
                              <?php elseif($sale->sale_status == 2): ?>
                              <td><div class="badge badge-danger"><?php echo e(trans('file.Pending')); ?></div></td>
                              <?php else: ?>
                              <td><div class="badge badge-warning"><?php echo e(trans('file.Draft')); ?></div></td>
                              <?php endif; ?>
                              <td style="    color: #ff8800;">
                                  
                                
                                  
                                  
                                                <?php
                             $iran=number_format($sale->grand_total, 2);
                  
                                                
                     echo     substr($iran, 0, -3)  .config('currency'); 
                    ?>
                    
                                  
                                  
                                  </td>
                            </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                          </tbody>
                        </table>
                      </div>
                  </div>
                  <div role="tabpanel" class="tab-pane fade" id="purchase-latest">
                      <div class="table-responsive">
                        <table class="table">
                          <thead>
                            <tr>
                              <th><?php echo e(trans('file.date')); ?></th>
                              <th><?php echo e(trans('file.reference')); ?></th>
                              <th><?php echo e(trans('file.Supplier')); ?></th>
                              <th><?php echo e(trans('file.status')); ?></th>
                              <th><?php echo e(trans('file.grand total')); ?></th>
                            </tr>
                          </thead>
                          <tbody>
                            <?php $__currentLoopData = $recent_purchase; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $purchase): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <?php $supplier = DB::table('suppliers')->find($purchase->supplier_id); ?>
                            <tr>
                              <td>
                              
                              
                                                        <?php


		date_default_timezone_set('Asia/Tehran');


		list($gy, $gm, $gd) = explode('-', ($purchase->created_at->toDateString()));


		$j_date_array = gregorian_to_jalali($gy, $gm, $gd); //خروجی آرایه
		$j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //خروجی رشته
		
		
		echo $j_date_string;
?>
                              
                              
                              
                              
                              
                              
                              
                              </td>
                              <td><?php echo e($purchase->reference_no); ?></td>
                              <?php if($supplier): ?>
                                <td><?php echo e($supplier->name); ?></td>
                              <?php else: ?>
                                <td>N/A</td>
                              <?php endif; ?>
                              <?php if($purchase->status == 1): ?>
                              <td><div class="badge badge-success">دریافت شد</div></td>
                              <?php elseif($purchase->status == 2): ?>
                              <td><div class="badge badge-success">جزئي</div></td>
                              <?php elseif($purchase->status == 3): ?>
                              <td><div class="badge badge-danger">در انتظار</div></td>
                              <?php else: ?>
                              <td><div class="badge badge-danger">سفارش داده شده</div></td>
                              <?php endif; ?>
                              <td style="    color: #ff8800;">
                              
                              
                              
                              
                                                     
                                                <?php
                             $iran=number_format($purchase->grand_total, 2);
                  
                                                
                     echo     substr($iran, 0, -3)  .config('currency'); 
                    ?>
                    
                              
                              </td>
                              
                              
                              
                              
                              
                            </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                          </tbody>
                        </table>
                      </div>
                  </div>
                  <div role="tabpanel" class="tab-pane fade" id="quotation-latest">
                      <div class="table-responsive">
                        <table class="table">
                          <thead>
                            <tr>
                              <th><?php echo e(trans('file.date')); ?></th>
                              <th><?php echo e(trans('file.reference')); ?></th>
                              <th><?php echo e(trans('file.customer')); ?></th>
                              <th><?php echo e(trans('file.status')); ?></th>
                              <th><?php echo e(trans('file.grand total')); ?></th>
                            </tr>
                          </thead>
                          <tbody>
                            <?php $__currentLoopData = $recent_quotation; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $quotation): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <?php $customer = DB::table('customers')->find($quotation->customer_id); ?>
                            <tr>
                              <td>
                              
                              <?php


		date_default_timezone_set('Asia/Tehran');


		list($gy, $gm, $gd) = explode('-', ($quotation->created_at->toDateString()));


		$j_date_array = gregorian_to_jalali($gy, $gm, $gd); //خروجی آرایه
		$j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //خروجی رشته
		
		
		echo $j_date_string;
?>
                              
                              
                              
                              </td>
                              
                              
                              
                              <td><?php echo e($quotation->reference_no); ?></td>
                              <td><?php echo e($customer->name); ?></td>
                              <?php if($quotation->quotation_status == 1): ?>
                              <td><div class="badge badge-danger">در انتظار</div></td>
                              <?php else: ?>
                              <td><div class="badge badge-success">ارسال</div></td>
                              <?php endif; ?>
                              <td style="    color: #ff8800;">
                                  
                                  
                    
                                  
                                                                  <?php
                             $iran=number_format($quotation->grand_total, 2);
                  
                                                
                     echo     substr($iran, 0, -3)  .config('currency'); 
                    ?>
                                  </td>
                            </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                          </tbody>
                        </table>
                      </div>
                  </div>
                  <div role="tabpanel" class="tab-pane fade" id="payment-latest">
                      <div class="table-responsive">
                        <table class="table">
                          <thead>
                            <tr>
                              <th><?php echo e(trans('file.date')); ?></th>
                              <th><?php echo e(trans('file.reference')); ?></th>
                              <th><?php echo e(trans('file.Amount')); ?></th>
                              <th><?php echo e(trans('file.Paid By')); ?></th>
                            </tr>
                          </thead>
                          <tbody>
                            <?php $__currentLoopData = $recent_payment; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $payment): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <tr>
                              <td>
                              
                                                            
                              <?php


		date_default_timezone_set('Asia/Tehran');


		list($gy, $gm, $gd) = explode('-', ($payment->created_at->toDateString()));


		$j_date_array = gregorian_to_jalali($gy, $gm, $gd); //خروجی آرایه
		$j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //خروجی رشته
		
		
		echo $j_date_string;
?>
                              
                              
                              
                              
                              
                              </td>
                              <td><?php echo e($payment->payment_reference); ?></td>
                              <td   <td style="    color: #ff8800;"> 
                                                     
                                                                  <?php
                             $iran=number_format($payment->amount, 2);
                  
                                                
                     echo     substr($iran, 0, -3)  .config('currency'); 
                    ?>
                              
                     
                              
                              
                              </td>
                              <td>
                              
                              
                              
                              
                              
                                 <?php
                                if ($payment->paying_method =="Cheque") {
                                echo "چک";

                                 }

 if ($payment->paying_method == "Cash") {
                                echo "نقدی";
 

                                 }
                                 
                                 
                                 
 if ($payment->paying_method == "Gift Card") {
                                echo "کارت هدیه";
 

                                 }
                                  if ($payment->paying_method == "Credit Card") {
                                echo "کارت اعتباری";
 

                                 }
                                  ?>
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              </td>
                            </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                          </tbody>
                        </table>
                      </div>
                  </div>
                </div>
              </div>
            </div>
          
          
          
          
          
          
          
          
      
            <div class="col-md-5">
              <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                  <h4><?php echo e(trans('file.Best Seller').' '. '('.trans('file.price').')'); ?></h4>
                  <div class="right-column">
                    <div class="badge badge-primary"><?php echo e(trans('file.top')); ?> 5</div>
                  </div>
                </div>
                <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>ردیف </th>
                          <th><?php echo e(trans('file.Product Details')); ?></th>
                          <th><?php echo e(trans('file.grand total')); ?></th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php $__currentLoopData = $yearly_best_selling_price; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $sale): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <?php $product = DB::table('products')->find($sale->product_id); ?>
                        <tr>
                          <td><?php echo e($key + 1); ?></td>
                          <td><?php echo e($product->name); ?><br>[<?php echo e($product->code); ?>]</td>
                          <td style="color:#7c5cc4">
                 
                    
                           <?php
                             $iran=number_format($sale->total_price, 2);
                     echo     substr($iran, 0, -3)  .config('currency'); 
                    ?>
                         
                          
                          </td>
                        </tr>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                      </tbody>
                    </table>
                  </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      
<script type="text/javascript">
   
    $(".color-switcher .switcher-button").on('click', function() {
        $(".color-switcher").toggleClass("show-color-switcher", "hide-color-switcher", 300);
    });

   
    $('a.color').on('click', function() {
      
        $.get('setting/general_setting/change-theme/' + $(this).data('color'), function(data) {
        });
        var style_link= $('#custom-style').attr('href').replace(/([^-]*)$/, $(this).data('color') );
        $('#custom-style').attr('href', style_link);
    });

    $(".date-btn").on("click", function() {
        $(".date-btn").removeClass("active");
        $(this).addClass("active");
        var start_date = $(this).data('start_date');
        var end_date = $(this).data('end_date');
        $.get('dashboard-filter/' + start_date + '/' + end_date, function(data) {
            dashboardFilter(data);
        });
    });

    function dashboardFilter(data){
        $('.revenue-data').hide();
        $('.revenue-data').html(parseFloat(data[0]).toFixed(2));
        $('.revenue-data').show(500);

        $('.return-data').hide();
        $('.return-data').html(parseFloat(data[1]).toFixed(2));
        $('.return-data').show(500);

        $('.profit-data').hide();
        $('.profit-data').html(parseFloat(data[2]).toFixed(2));
        $('.profit-data').show(500);

        $('.purchase_return-data').hide();
        $('.purchase_return-data').html(parseFloat(data[3]).toFixed(2));
        $('.purchase_return-data').show(500);
    }
</script>
<?php $__env->stopSection(); ?>


<?php echo $__env->make('layout.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/edomeir/public_html/edosale_new/resources/views/index.blade.php ENDPATH**/ ?>