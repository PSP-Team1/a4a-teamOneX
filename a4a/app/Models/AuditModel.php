<?php

namespace App\Models;

use CodeIgniter\Model;

class AuditModel extends Model
{

    function getAudits()
    {
        $db = db_connect();

        $sql = "
        SELECT 
            ca.id AS audit_id,
            atemp.auditor,
            atemp.audit_version,
            atemp.published_status,
            atemp.legislation_version,
            ca.company_id,
            count(car.response) AS audit_prog,
            count(car.id) AS audit_total

            FROM company c
            inner JOIN company_audit ca ON
            ca.audit_template = c.id

            inner JOIN audit_template atemp ON 
            ca.audit_template = atemp.id
            JOIN company_audit_response car ON 
            car.audit_id = ca.id

            GROUP BY ca.id";
        $results = $db->query($sql)->getResult('array');
        return $results;
    }


    function getQuestions($id)
    {
        $db = db_connect();

        $sql = "
            SELECT 
            ca.id AS audit_id,
            atemp.audit_version,
            atemp.legislation_version,
            ca.company_id,
            aq.category,
            aq.question,
            car.id AS car_id,
            car.response,
            car.notes

            FROM company c
            inner JOIN company_audit ca ON
            ca.audit_template = c.id

            inner JOIN audit_template atemp ON 
            ca.audit_template = atemp.id
            JOIN company_audit_response car ON 
            car.audit_id = ca.id

            LEFT JOIN audit_questions aq ON aq.id = car.question_id

            WHERE ca.id = ". $id . " ;";

            // XXX remove hardcoded query

        $results = $db->query($sql)->getResult('array');

        $questionData = array();

        foreach ($results as $row) {
            
            $questionData[$row['category']][] = $row;
            
        }

        return $questionData;
    }


     function updateResponse($data){

        $db = db_connect();
        
        if (isset($data['id'])) {
            // If the ID is set, update the existing record
            $query = "UPDATE `company_audit_response` SET  `response` = ?,  `notes` = ? WHERE `id` = ?";
            $params = [ $data['response'],  $data['notes'], $data['id']];
            $db->query($query, $params);
        }

        // Return true if the update or insert was successful, false otherwise
        return $db->affectedRows() > 0;
    }

    
}