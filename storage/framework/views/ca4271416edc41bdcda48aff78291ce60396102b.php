<?php $__env->startSection('content'); ?>


<section>
    
	<h3 class="text-center"><?php echo e(trans('file.Summary Report')); ?></h3>

	<div class="container-fluid">
		<div class="row mt-4">
		    
		    
		    
		    
		    
			<div class="col-md-3">
				<div class="colored-box">
					<i class="fa fa-heart"></i>
					<h3><?php echo e(trans('file.Purchase')); ?></h3>
					<hr>
					<div class="mt-3">
						<p class="mt-2" ><?php echo e(trans('file.Amount')); ?>: <span style="    color: #09abb3;"> 
						<?php
						 $iran=number_format($purchase[0]->grand_total, 2);
                         echo     substr($iran, 0, -3).' '.config('currency'); ;
						?>
						</span></p>
						<p class="mt-2"><?php echo e(trans('file.Purchase')); ?>: <span style="    color: #09abb3;"><?php echo e($total_purchase); ?></span></p>
						<p class="mt-2"><?php echo e(trans('file.Paid')); ?> : <span style="    color: #09abb3;" >
						    
						<?php
						$iran=number_format($purchase[0]->paid_amount, 2);
                         echo     substr($iran, 0, -3).' '.config('currency'); ;
						?>
						</span></p>
						<p class="mt-2"><?php echo e(trans('file.Tax')); ?> : <span style="    color: #09abb3;">
						
						<?php
						$iran=number_format($purchase[0]->tax, 2);
                         echo     substr($iran, 0, -3).' '.config('currency'); ;
						?>
						</span></p>
					</div>
				</div>
			</div>
			
			
			
			
			
			
			
			
			
			
			
			<div class="col-md-3">
				<div class="colored-box">
					<i class="fa fa-shopping-cart"></i>
					<h3><?php echo e(trans('file.Sale')); ?></h3>
					<hr>
					<div class="mt-3">
						<p class="mt-2"><?php echo e(trans('file.Amount')); ?> :<span style="    color: #09abb3;"> 
						
						
							
								<?php
							$iran=number_format($sale[0]->grand_total, 2);
					
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); ;
						?>
						
						</span></p>
						<p class="mt-2"><?php echo e(trans('file.Sale')); ?> :<span style="    color: #09abb3;"><?php echo e($total_sale); ?></span></p>
						<p class="mt-2"><?php echo e(trans('file.Paid')); ?> :<span style="    color: #09abb3;">
						
									<?php
						
						
                          $iran=number_format($sale[0]->paid_amount, 2); 
                         echo     substr($iran, 0, -3).' '.config('currency'); ;
						?>
						
						</span></p>
						<p class="mt-2"><?php echo e(trans('file.Tax')); ?> :<span style="    color: #09abb3;" >
						
						
									<?php
						    $iran=number_format($sale[0]->tax, 2); 
				
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); ;
						?>
						
						</span></p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="colored-box">
					<i class="fa fa-random "></i>
					<h3><?php echo e(trans('file.Sale Return')); ?></h3>
					<hr>
					<div class="mt-3">
						<p class="mt-2"><?php echo e(trans('file.Amount')); ?>: <span style="    color: #09abb3;">
						
						
									<?php
						    $iran=number_format($return[0]->grand_total, 2); 
						  
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); ;
						?>
						</span></p>
						<p class="mt-2"><?php echo e(trans('file.Return')); ?>: <span style="    color: #09abb3;"><?php echo e($total_return); ?>

						
						
						
						</span></p>
						<p class="mt-2"><?php echo e(trans('file.Tax')); ?>: <span style="    color: #09abb3;">
						
						
										<?php
						   $iran=number_format($return[0]->tax, 2); 
						
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); ;
						?>
						
						</span></p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="colored-box">
					<i class="fa fa-random "></i>
					<h3><?php echo e(trans('file.Purchase Return')); ?></h3>
					<hr>
					<div class="mt-3">
						<p class="mt-2"><?php echo e(trans('file.Amount')); ?>: <span style="    color: #09abb3;">
						    
						    							<?php
						   $iran=number_format($purchase_return[0]->grand_total, 2); 
						
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); ;
						?>
						
						     
						     
						     </span></p>
						<p class="mt-2"><?php echo e(trans('file.Return')); ?>: <span style="    color: #09abb3;">
						    
						    			    							<?php
						   $iran=number_format($total_purchase_return, 2); 
						
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); ;
						?>
						   
						    
						    
						    </span></p>
						<p class="mt-2"><?php echo e(trans('file.Tax')); ?>: <span style="    color: #09abb3;">
						    
						    		    			    							<?php
						   $iran=number_format($purchase_return[0]->tax, 2); 
						
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); ;
						?>
						    </span></p>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-2">
			<div class="col-md-4">
				<div class="colored-box">
					<i class="fa fa-money"></i>
					<h3><?php echo e(trans('file.profit')); ?> / <?php echo e(trans('file.Loss')); ?></h3>
					<hr>
					<div class="mt-3">
						<p class="mt-2"><?php echo e(trans('file.Sale')); ?> :<span  style="    color: #09abb3;">
						
											<?php
						
						  
						      $iran=number_format($sale[0]->grand_total, 2); 
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); 
						?>
						</span></p>
						<p class="mt-2"><?php echo e(trans('file.Purchase')); ?>: <span  style="    color: #09abb3;"> 
						
												<?php
						$iran=number_format($purchase[0]->grand_total, 2); 
					
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); 
						?>
						
						
						
						</span></p>
						<p class="mt-2"><?php echo e(trans('file.profit')); ?> :<span  style="    color: #09abb3;"> 
						
				
						
						
														<?php
						$test=number_format((float)($sale[0]->grand_total - $purchase[0]->grand_total), 2, '.', '') ;
						 
                                                
                         echo     substr($test, 0, -3).' '.config('currency'); 
						?>
						
						
						</span></p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="colored-box">
					<i class="fa fa-money"></i>
					<h3><?php echo e(trans('file.profit')); ?> / <?php echo e(trans('file.Loss')); ?></h3>
					<hr>
					<div class="mt-3">
						<p class="mt-2"><?php echo e(trans('file.Sale')); ?> :<span  style="    color: #09abb3;">
						<?php
						
							$iran=number_format($sale[0]->grand_total, 2);
						  echo     substr($iran, 0, -3).' '.config('currency'); 
					
						
						?>
						
						</span></p>
						<p class="mt-2"><?php echo e(trans('file.Purchase')); ?>: <span  style="    color: #09abb3;">
						    
						    		<?php
						
							$iran=number_format($purchase[0]->grand_total, 2);
						  echo     substr($iran, 0, -3).' '.config('currency'); 
					
						
						?>
						   
			
						
						</span></p>
						<p class="mt-2"><?php echo e(trans('file.Sale Return')); ?> :<span  style="    color: #09abb3;">
						    
						    		    		<?php
						
							$iran=number_format($return[0]->grand_total, 2);
						  echo     substr($iran, 0, -3).' '.config('currency'); 
					
						
						?>
		
				
						</span></p>
						<p class="mt-2"><?php echo e(trans('file.Purchase Return')); ?>: <span style="    color: #09abb3;"> 
						
						
									    		    		<?php
						
							$iran=number_format($purchase_return[0]->grand_total, 2);
						  echo     substr($iran, 0, -3).' '.config('currency'); 
					
						
						?>
						
				
						
					
						</span></p>
						<p class="mt-2"><?php echo e(trans('file.profit')); ?>: <span  style="    color: #09abb3;">
						    
						    					    		    		<?php
						
							$iran=number_format(($sale[0]->grand_total - $purchase[0]->grand_total - $return[0]->grand_total + $purchase_return[0]->grand_total), 2);
						  echo     substr($iran, 0, -3).' '.config('currency'); 
					
						
						?>
						    
						    
					
						
						
						</span></p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="colored-box">
					<i class="fa fa-money "></i>
					<h3><?php echo e(trans('file.Net Profit')); ?> / <?php echo e(trans('file.Net Loss')); ?>

					
					
					
					
					</h3>
					<hr>
					<h4 class="text-center">
					    
					   
				<?php
				
				
				  $iran=number_format(number_format((float)(($sale[0]->grand_total-$sale[0]->tax) - ($purchase[0]->grand_total-$purchase[0]->tax) - ($return[0]->grand_total-$return[0]->tax) + ($purchase_return[0]->grand_total-$purchase_return[0]->tax)), 2, '.', ''), 2);
                       

            echo  $iran2=substr($iran, 0, -3)  .' '.config('currency');;
             ?>
				
				 </h4>
					<p class="text-center">
					    
					    
						(<?php echo e(trans('file.Sale')); ?> <?php echo e(number_format((float)($sale[0]->grand_total), 2, '.', '')); ?> - <?php echo e(trans('file.Tax')); ?> <?php echo e(number_format((float)($sale[0]->tax), 2, '.', '')); ?>) - (<?php echo e(trans('file.Purchase')); ?> <?php echo e(number_format((float)($purchase[0]->grand_total), 2, '.', '')); ?> - <?php echo e(trans('file.Tax')); ?> <?php echo e(number_format((float)($purchase[0]->tax), 2, '.', '')); ?>) - (<?php echo e(trans('file.Return')); ?> <?php echo e(number_format((float)($return[0]->grand_total), 2, '.', '')); ?> - <?php echo e(trans('file.Tax')); ?> <?php echo e(number_format((float)($return[0]->tax), 2, '.', '')); ?>) + (<?php echo e(trans('file.Purchase Return')); ?> <?php echo e(number_format((float)($purchase_return[0]->grand_total), 2, '.', '')); ?> - <?php echo e(trans('file.Tax')); ?> <?php echo e(number_format((float)($purchase_return[0]->tax), 2, '.', '')); ?>)
					</p>
				</div>
			</div>
		</div>
		<div class="row mt-2">
			<div class="col-md-3">
				<div class="colored-box">
					<i class="fa fa-dollar"></i>
					<h3><?php echo e(trans('file.Payment Recieved')); ?></h3>
					<hr>
					<div class="mt-3">
						<p class="mt-2"><?php echo e(trans('file.Amount')); ?>: <span style="    color: #09abb3;">
													<?php
							$iran=number_format($payment_recieved, 2);
					
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); 
						?>
						
						</span></p>
						<p class="mt-2"><?php echo e(trans('file.Recieved')); ?>: <span style="    color: #09abb3;"><?php echo e($payment_recieved_number); ?>

						
						
						
						</span></p>
						<p class="mt-2">نقدی:  <span   style="    color: #09abb3;" >
														<?php
							$iran=number_format($cash_payment_sale, 2);
					
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); 
						?>
						
						

						
						</span></p>
						<p class="mt-2">چک  :<span  style="    color: #09abb3;" >
							
							
																<?php
							$iran=number_format($cheque_payment_sale, 2);
					
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); 
						?>
		
						
						
						
						</span></p>
						<p class="mt-2">کارت اعتباری <span style="    color: #09abb3;" >
						
						
						
						
								   												<?php
							$iran=number_format($credit_card_payment_sale, 2);
					
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); 
						?> 
		
						
						
					</span></p>
						<p class="mt-2">کارت هدیه <span style="    color: #09abb3;" >
						
						    
						  
					<?php
							$iran=number_format($gift_card_payment_sale, 2);
					
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); 
						?>  
				
						    
						    
						    </span></p>
						<p class="mt-2">پرداخت: <span  style="    color: #09abb3;" >
						    
						    
						    		<?php
							$iran=number_format($paypal_payment_sale, 2);
					
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); 
						?>  
						   
				
						
						</span></p>
						<p class="mt-2">سپرده: <span  style="    color: #09abb3;" >
						    
						    		    		<?php
							$iran=number_format($deposit_payment_sale, 2);
					
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); 
						?>  
				
						
						
						</span></p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="colored-box">
					<i class="fa fa-dollar"></i>
					<h3><?php echo e(trans('file.Payment Sent')); ?></h3>
					<hr>
					<div class="mt-3">
					    
					    
					    
						<p class="mt-2"><?php echo e(trans('file.Amount')); ?> :<span  style="    color: #09abb3;" >
						    
						    
						    		    
						    		    		<?php
							$iran=number_format($payment_sent, 2);
					
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); 
						?>  
				
						
						
						
						</span></p>
						
						
						
						
						<p class="mt-2"><?php echo e(trans('file.Recieved')); ?>: <span  style="    color: #09abb3;" >
						    
						    
						    
						    <?php echo e($payment_sent_number); ?></span></p>
						
						
						
						<p class="mt-2">نقدی <span style="    color: #09abb3;" >
						
							    		    		<?php
							$iran=number_format($cash_payment_purchase, 2);
					
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); 
						?>  
			
						
						
						</span></p>
						
						
						<p class="mt-2">چک <span   style="    color: #09abb3;" >
						    
						    
						    		
							    		    		<?php
							$iran=number_format($cheque_payment_purchase, 2);
					
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); 
						?>  
						
						
				
						
						
						</span></p>
						
						<p class="mt-2">کارت اعتباری <span style="    color: #09abb3;" >
						
						
						
									    		    		<?php
							$iran=number_format($credit_card_payment_purchase, 2);
					
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); 
						?>  
						
						
				
						
						
						</span></p>
						
						
						
						
						
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="colored-box">
					<i class="fa fa-dollar"></i>
					<h3><?php echo e(trans('file.Expense')); ?></h3>
					<hr>
					<div class="mt-3">
						<p class="mt-2"><?php echo e(trans('file.Amount')); ?>: <span  style="    color: #09abb3;"> 
						
						
						
											    		    		<?php
							$iran=number_format($expense, 2);
					
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); 
						?>  
						
						
				
						
						
						</span></p>
						<p class="mt-2"><?php echo e(trans('file.Expense')); ?>: <span  style="    color: #09abb3;"> 
						    
						    <?php echo e($total_expense); ?>

						    
						    
						    </span></p>
						
						
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="colored-box">
					<i class="fa fa-dollar"></i>
					<h3><?php echo e(trans('file.Payroll')); ?></h3>
					<hr>
					<div class="mt-3">
						<p class="mt-2"><?php echo e(trans('file.Amount')); ?>: <span  style="    color: #09abb3;"> 
						
						
					
						
													<?php
			 $iran=number_format($payroll, 2);
                       

             $iran2=substr($iran, 0, -3)  ;
             
						
						 
						?>
						
						
						</span></p>
						<p class="mt-2"><?php echo e(trans('file.Payroll')); ?>: <span  style="    color: #09abb3;"> 
						    
						    
						    <?php echo e($total_payroll); ?>

						    
						    
						    </span></p>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4">
				<div class="colored-box">
					<i class="fa fa-dollar"></i>
					<h3><?php echo e(trans('file.Cash in Hand')); ?></h3>
					<hr>
					<div class="mt-3">
					    
					    
						<p class="mt-2"><?php echo e(trans('file.Recieved')); ?>: <span style="    color: #09abb3;"> 
						    
						    
						    
						    					    		    		<?php
							$iran=number_format($payment_recieved, 2);
					
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); 
						?>  
						     
					
						     </span></p>
						     
						     
						     
						     
						<p class="mt-2"><?php echo e(trans('file.Sent')); ?>: <span style="    color: #09abb3;"> 
						
						
						<?php
							$iran=number_format($payment_sent, 2);
					
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); 
						?>  
						
					
						
						
				
						
						
						</span></p>
						<p class="mt-2"><?php echo e(trans('file.Sale Return')); ?>: <span style="    color: #09abb3;"> 
						
						
						
						
							<?php
							$iran=number_format($return[0]->grand_total, 2);
					
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); 
						?>  
						
					
						
						
						
						</span></p>
						<p class="mt-2"><?php echo e(trans('file.Purchase Return')); ?>: <span style="    color: #09abb3;"> 
						    
						    
						    
						    
						    		<?php
							$iran=number_format($purchase_return[0]->grand_total, 2);
					
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); 
						?>  
						    
						    
					
						    
						     
						     
						     </span></p>
						<p class="mt-2"><?php echo e(trans('file.Expense')); ?>: <span style="    color: #09abb3;"> 
						
					
					
					 		<?php
							$iran=number_format($expense, 2);
					
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); 
						?> 
					
					
						</span></p>
						
						
						<p class="mt-2"><?php echo e(trans('file.Payroll')); ?>: <span style="    color: #09abb3;"> 
						
								    
								    
								    	<?php
							$iran=number_format($payroll, 2);
					
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); 
						?> 
								    
					
						
						
						</span></p>
						<p class="mt-2"><?php echo e(trans('file.In Hand')); ?>: <span style="    color: #09abb3;"> 
						    
						    
						   
						    		    	<?php
							$iran=number_format(($payment_recieved - $payment_sent - $return[0]->grand_total + $purchase_return[0]->
						    grand_total - $expense - $payroll), 2);
					
                                                
                         echo     substr($iran, 0, -3).' '.config('currency'); 
						?> 
						
						
					
						
						    
						    
						    </span></p>
				
				
				
				
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-2">
			<?php $__currentLoopData = $warehouse_name; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $name): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
				<div class="col-md-4">
					<div class="colored-box">
						<i class="fa fa-money"></i>
						<h3><?php echo e($name); ?></h3>
						<h4 class="text-center mt-3">
						  
						    
						    <?php
						    
						      $iran=number_format(number_format((float)($warehouse_sale[$key][0]->grand_total - $warehouse_purchase[$key][0]->grand_total - $warehouse_return[$key][0]->grand_total + $warehouse_purchase_return[$key][0]->grand_total), 2, '.', ''), 2);
                       

                                echo   $iran2=substr($iran, 0, -3) .' '.config('currency'); ;
						    
						    
						    ?>
						    
						    
						    </h4>
						<p class="text-center">
						    
						    
						    
						    
							<?php echo e(trans('file.Sale')); ?> <?php echo e(number_format((float)($warehouse_sale[$key][0]->grand_total), 2, '.', '')); ?> - <?php echo e(trans('file.Purchase')); ?> <?php echo e(number_format((float)($warehouse_purchase[$key][0]->grand_total), 2, '.', '')); ?> - <?php echo e(trans('file.Sale Return')); ?> <?php echo e(number_format((float)($warehouse_return[$key][0]->grand_total), 2, '.', '')); ?> + <?php echo e(trans('file.Purchase Return')); ?> <?php echo e(number_format((float)($warehouse_purchase_return[$key][0]->grand_total), 2, '.', '')); ?>

						</p>
						<hr style="border-color: rgba(0, 0, 0, 0.2);">
						<h4 class="text-center">
						    
						    
						    		    
						    <?php
		       
                            $iran=number_format((($warehouse_sale[$key][0]->grand_total - $warehouse_sale[$key][0]->tax) - ($warehouse_purchase[$key][0]->grand_total - $warehouse_purchase[$key][0]->tax) - ($warehouse_return[$key][0]->grand_total - $warehouse_return[$key][0]->tax) + ($warehouse_purchase_return[$key][0]->grand_total - $warehouse_purchase_return[$key][0]->tax) ), 2);
                              echo   $iran2=substr($iran, 0, -3) .' '.config('currency'); 
			    
						    ?>
						    
						    </h4>
						<p class="text-center">
							 <?php echo e(trans('file.Net Sale')); ?> <?php echo e(number_format((float)($warehouse_sale[$key][0]->grand_total - $warehouse_sale[$key][0]->tax), 2, '.', '')); ?> -  <?php echo e(trans('file.Net Purchase')); ?> <?php echo e(number_format((float)($warehouse_purchase[$key][0]->grand_total - $warehouse_purchase[$key][0]->tax), 2, '.', '')); ?> - <?php echo e(trans('file.Net Sale Return')); ?> <?php echo e(number_format((float)($warehouse_return[$key][0]->grand_total - $warehouse_return[$key][0]->tax), 2, '.', '')); ?> + <?php echo e(trans('file.Net Purchase Return')); ?> <?php echo e(number_format((float)($warehouse_purchase_return[$key][0]->grand_total - $warehouse_purchase_return[$key][0]->tax), 2, '.', '')); ?>

						</p>
						<hr style="border-color: rgba(0, 0, 0, 0.2);">
						<h4 class="text-center">
						
						<?php
						
						  $iran=number_format($warehouse_expense[$key], 2);
                           echo  $iran2=substr($iran, 0, -3)   .' '.config('currency'); 
				?>
						
						
						
						
						</h4>
						<p class="text-center"><?php echo e(trans('file.Expense')); ?></p>
					</div>
				</div>
			<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
		</div>
	</div>
</section>

<script type="text/javascript">

	$("ul#report").siblings('a').attr('aria-expanded','true');
    $("ul#report").addClass("show");
    $("ul#report #profit-loss-report-menu").addClass("active");

	$(".daterangepicker-field").daterangepicker({
	  callback: function(startDate, endDate, period){
	    var start_date = startDate.format('YYYY-MM-DD');
	    var end_date = endDate.format('YYYY-MM-DD');
	    var title = start_date + ' To ' + end_date;
	    $(this).val(title);
	    $('input[name="start_date"]').val(start_date);
	    $('input[name="end_date"]').val(end_date);
	  }
	});
</script>




<script type="text/javascript">
   $(function() {
        $("#input1, #span1").persianDatepicker();       
    });
    
    
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layout.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/edogroup/edosale.edogroup.ir/resources/views/report/profit_loss.blade.php ENDPATH**/ ?>