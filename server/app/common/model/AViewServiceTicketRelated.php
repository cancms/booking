<?php

/**
 *



 -- 創建VIEW

DROP VIEW IF EXISTS sn_a_view_service_ticket_related;
CREATE VIEW sn_a_view_service_ticket_related  AS
(    select
      ticket.service_schedule_setting_id,
      ticket.service_person_id,
      ticket.service_time,
      if(ticket.booking_minutes_delay, ticket.booking_minutes_delay, 0) as booking_minutes_delay,
      if(b.id, b.id, NULL) as is_booked,
      b.booking_status

    from
    --查询全部设好的服务时间点，放号点
    (select  s.service_person_id, s.booking_minutes_delay,
                  r.service_time, r.service_schedule_setting_id
          from sn_a_service_ticket_related as r left join sn_a_service_schedule_setting as s
                on r.service_schedule_setting_id = s.id
         ) as ticket

         left join sn_a_booking as b
              on b.service_time = ticket.service_time and  b.service_person_id = ticket.service_person_id
);




 *
 *
 */

namespace app\common\model;


use app\common\model\BaseModel;


/**
 * AServedPerson 模型, 实际接受服务的人
 * Class AServedPerson
 * @package app\common\model
 */
class AViewServiceTicketRelated extends BaseModel
{

    protected $name = 'a_view_service_ticket_related';

}
