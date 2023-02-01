@extends('layout.main') @section('content')
@if(session()->has('message'))
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{!! session()->get('message') !!}</div> 
@endif
<section class="forms">
    <div class="container-fluid">
        <h3>{{trans('file.Account Statement')}}</h3>
        <strong>{{trans('file.Account')}}:</strong> {{$lims_account_data->name}} [{{$lims_account_data->account_no}}]
    </div>
    <div class="table-responsive mb-4">
        <table id="account-table" class="table table-hover">
            <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th>{{trans('file.date')}}</th>
                    <th>{{trans('file.reference')}}</th>
                    <th>{{trans('file.Credit')}}</th>
                    <th>{{trans('file.Debit')}}</th>
                    <th>{{trans('file.Balance')}}</th>
                </tr>
            </thead>
            <tbody>
                
                <?php
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
                
                
                @foreach($credit_list as $key=>$credit)
                @php $balance = $balance + $credit->amount; @endphp
                <tr>
                    <td>{{$key}}</td>
                    <td>
                    
                    
                           <?php 
                                 
       $iran=date($general_setting->date_format, strtotime($credit->created_at->toDateString()));
       date_default_timezone_set('Asia/Tehran');
       list($gy, $gm, $gd) = explode('/', ($iran));
		$j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //خروجی رشته
                   echo $j_date_string;
                    
                    ?> 
                    
                    
                    
                    
                    
                    </td>
                    
                    
                    <td>{{$credit->payment_reference}}</td>
                    <td>
                    
                    <?php
    $iran=number_format((float)$credit->amount, 2, '.', '');
     echo     substr($iran, 0, -3) ;
                    ?>
                    
                    
                    
                    </td>
                    <td>0.0</td>
                    <td>{{number_format((float)$balance, 2, '.', '')}}</td>
                </tr>
                @endforeach

                @foreach($recieved_money_transfer_list as $key=>$recieved_money)
                @php $balance = $balance + $recieved_money->amount; @endphp
                <tr>
                    <td>{{$key}}</td>
                    <td>
                    
                    
                    
                           <?php 
                                 
       $iran=date($general_setting->date_format, strtotime($recieved_money->created_at->toDateString()));
       date_default_timezone_set('Asia/Tehran');
       list($gy, $gm, $gd) = explode('/', ($iran));
		$j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //خروجی رشته
                   echo $j_date_string;
                    ?> 
                    
                    
                    
                    
                    </td>
                    <td>{{$recieved_money->reference_no}}</td>
                    <td>{{number_format((float)$recieved_money->amount, 2, '.', '')}}</td>
                    <td>0.0</td>
                    <td>{{number_format((float)$balance, 2, '.', '')}}</td>
                </tr>
                @endforeach

                @foreach($debit_list as $key=>$debit)
                @php $balance = $balance - $debit->amount; @endphp
                <tr>
                    <td>{{$key}}</td>
                    <td>
                    
                               <?php 
                                 
       $iran=date($general_setting->date_format, strtotime($debit->created_at->toDateString()));
       date_default_timezone_set('Asia/Tehran');
       list($gy, $gm, $gd) = explode('/', ($iran));
	   $j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //خروجی رشته
       echo $j_date_string;

                    ?> 
                    
                    
                    
                    
                    </td>
                    <td>{{$debit->payment_reference}}</td>
                    <td>0.0</td>
                    <td>{{number_format((float)$debit->amount, 2, '.', '')}}</td>
                    <td>{{number_format((float)$balance, 2, '.', '')}}</td>
                </tr>
                @endforeach

                @foreach($return_list as $key=>$return)
                @php $balance = $balance - $return->grand_total; @endphp
                <tr>
                    <td>{{$key}}</td>
                    <td>
         <?php 
       $iran=date($general_setting->date_format, strtotime($return->created_at->toDateString()));
       date_default_timezone_set('Asia/Tehran');
       list($gy, $gm, $gd) = explode('/', ($iran));

		$j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //خروجی رشته


                   echo $j_date_string;
                    

                    ?> 
                    
                    
                    
                    
                    
                    
                    </td>
                    <td>{{$return->reference_no}}</td>
                    <td>0.0</td>
                    <td>{{number_format((float)$return->grand_total, 2, '.', '')}}</td>
                    <td>{{number_format((float)$balance, 2, '.', '')}}</td>
                </tr>
                @endforeach

                @foreach($purchase_return_list as $key=>$return)
                @php $balance = $balance + $return->grand_total; @endphp
                <tr>
                    <td>{{$key}}</td>
                    <td>
                    
                                       <?php 
                                 
       $iran=date($general_setting->date_format, strtotime($return->created_at->toDateString()));
       date_default_timezone_set('Asia/Tehran');
       list($gy, $gm, $gd) = explode('/', ($iran));


		$j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //خروجی رشته


                   echo $j_date_string;
                    

                    ?> 
                    
                    
                    
                    
                    
                    
                    
                    </td>
                    <td>{{$return->reference_no}}</td>
                    <td>{{number_format((float)$return->grand_total, 2, '.', '')}}</td>
                    <td>0.0</td>
                    <td>{{number_format((float)$balance, 2, '.', '')}}</td>
                </tr>
                @endforeach

                @foreach($expense_list as $key=>$expense)
                @php $balance = $balance - $expense->amount; @endphp
                <tr>
                    <td>{{$key}}</td>
                    <td>
                    
                    
                    
                    
                        
                                                     <?php 
                                 
       $iran= date($general_setting->date_format, strtotime($expense->created_at->toDateString()));
       date_default_timezone_set('Asia/Tehran');
       list($gy, $gm, $gd) = explode('/', ($iran));


		$j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //خروجی رشته


                   echo $j_date_string;
                    

                    ?> 
                    
                    </td>
                    <td>{{$expense->reference_no}}</td>
                    <td>0.0</td>
                    <td>{{number_format((float)$expense->amount, 2, '.', '')}}</td>
                    <td>{{number_format((float)$balance, 2, '.', '')}}</td>
                </tr>
                @endforeach

                @foreach($payroll_list as $key=>$payroll)
                @php $balance = $balance - $payroll->amount; @endphp
                <tr>
                    <td>{{$key}}</td>
                    <td>
                    
                    
                                                     <?php 
                                 
       $iran= date($general_setting->date_format, strtotime($payroll->created_at->toDateString()));
       date_default_timezone_set('Asia/Tehran');
       list($gy, $gm, $gd) = explode('/', ($iran));


		$j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //خروجی رشته


                   echo $j_date_string;
                    

                    ?> 
                    
                    
                    
                    
                    
                    
                    
                    </td>
                    <td>{{$payroll->reference_no}}</td>
                    <td>0.0</td>
                    <td>{{number_format((float)$payroll->amount, 2, '.', '')}}</td>
                    <td>{{number_format((float)$balance, 2, '.', '')}}</td>
                </tr>
                @endforeach

                @foreach($sent_money_transfer_list as $key=>$sent_money)
                @php $balance = $balance - $sent_money->amount; @endphp
                <tr>
                    <td>{{$key}}</td>
                    <td>
                    
         <?php 
       $iran= date($general_setting->date_format, strtotime($sent_money->created_at->toDateString()));
       date_default_timezone_set('Asia/Tehran');
       list($gy, $gm, $gd) = explode('/', ($iran));
		$j_date_string = gregorian_to_jalali($gy, $gm, $gd, '/'); //خروجی رشته

                   echo $j_date_string;
                    

                    ?> 
                      
                    
                    
                    
                    
                    </td>
                    <td>{{$sent_money->reference_no}}</td>
                    <td>0.0</td>
                    <td>
                    
                    <?php
          $iran=number_format($sent_money->amount, 2);
           echo  $iran2=substr($iran, 0, -3).' '.config('currency');
                    ?>
                    
                    
                    
                    
                    </td>
                    <td>
             <?php
            $iran=number_format($balance, 2);
           echo  $iran2=substr($iran, 0, -3).' '.config('currency');
                    
                    ?>
                    
                    
                    
                    
                    
                    
                    
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</section>

<script type="text/javascript">
    $("ul#account").siblings('a').attr('aria-expanded','true');
    $("ul#account").addClass("show");
    $("ul#account #account-statement-menu").addClass("active");

    var table = $('#account-table').DataTable( {
        "order": [],
        'language': {
            'lengthMenu': '_MENU_ {{trans("file.records per page")}}',
             "info":      '<small>{{trans("file.Showing")}} _START_ - _END_ (_TOTAL_)</small>',
            "search":  '{{trans("file.Search")}}',
            'paginate': {
                    'previous': '<i class="dripicons-chevron-left"></i>',
                    'next': '<i class="dripicons-chevron-right"></i>'
            }
        },
        'columnDefs': [
            {
                "orderable": false,
                'targets': 0
            },
            {
                'render': function(data, type, row, meta){
                    if(type === 'display'){
                        data = '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>';
                    }

                   return data;
                },
                'checkboxes': {
                   'selectRow': true,
                   'selectAllRender': '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>'
                },
                'targets': [0]
            }
        ],
        'select': { style: 'multi',  selector: 'td:first-child'},
        'lengthMenu': [[10, 25, 50, -1], [10, 25, 50, "همه"]],
        dom: '<"row"lfB>rtip',
        buttons: [
        
            {
                extend: 'print',
                text: '{{trans("file.Print")}}',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                }
            },
            {
                extend: 'colvis',
                text: '{{trans("file.Column visibility")}}',
                columns: ':gt(0)'
            },
        ],
    } );

</script>
@endsection